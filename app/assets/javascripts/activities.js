// Activity Prototype //
function Activity(data) {
  this.id = data.id
  this.dueDate = data.due_date
  this.title = data.title
  this.categoryName = data.category.name
  this.description = data.description
  this.lists = data.lists
  this.countdown = this.countdown()
}

Activity.prototype.countdown = function() {
  // convert time string into milliseconds
  const timeRemainingInSecs = Date.parse(this.dueDate) - Date.parse(new Date())
  // divide/1000 => seconds, divide/60 => minutes...hours, days
  const days = Math.floor( timeRemainingInSecs/(1000*60*60*24) )

  if (days >= 0) {
    return `${days} until this drop is due!`
  } else {
    return 'Your drop is past due!'
  }
}

Activity.prototype.newUserActivityHtml = function () {
  return `<h2>Your Newest Drop!</h2><p>${this.title}</p><p>${this.categoryName}</p><p>${this.description}</p><p>${this.formatDate()}</p>`
}

Activity.prototype.formatDate = function() {
  // create new date object with the current activity's due date
  let date = new Date(this.dueDate).toDateString().split(' ')
    // => // ["Tue", "Mar", "19", "2019"]
  date.splice(3, 0, ", ")
  date.shift()

  return date.join(" ")
}

Activity.prototype.setDataIds = function() {
  $(".js-next").attr("data-id", this.id)
  $(".js-previous").attr("data-id", this.id)
  $("div#right").attr("data-id", this.id)
}

Activity.prototype.setText = function() {
  $("#activityTitle").text(this.title)
  $("#categoryName").text(this.categoryName)
  $("#description").text(this.description)
  $("#dueDate").text(this.formatDate())
  $("#pastDue").text(this.countdown)
}

 // Next/Previous DOM function //
function elementsHide() {
  // $("#new-list-form").hide()
  // $("#edit-activity").hide()
  $("#far-right").hide()
  // $("#right-column-content").hide()
  $("#show-add-to-do").hide()
  $("#show-to-dos").hide()
  $("#show-edit-activity").hide()
}

// Next Activity //
$(document).on("turbolinks:load", function() {
  $(".js-next").on("click", function(e) {
    e.preventDefault()

    elementsHide()

    const nextId = parseInt($(".js-next").attr("data-id")) + 1

    $.get("/activities/" + nextId + ".json", function(data) {
      const activity = new Activity(data)

      if (activity.lists.length != 0) {
        // $("#right-column-content").html("<h2> Drop To Dos </h2>")
        activity.lists.forEach(function(list) {
          // $("#right-column-content").show()
          // $("#right-column-content p").hide()
          $("#right-column-content").append(`<h4><p><a href="/activities/${activity.id}/lists/${list.id}"> ${list.name} </a></h4></p>`)
        })
      } else {
        // $("#right-column-content").html("You have no to-dos!")
      }
      activity.setText()
      activity.setDataIds()
    })
  })
})

// Previous Activity //
$(document).on("turbolinks:load", function() {
  $(".js-previous").on("click", function(e) {
    e.preventDefault()

    elementsHide()

    const previousId = parseInt($(".js-previous").attr("data-id")) - 1
    $.get("/activities/" + previousId + ".json", function(data) {

      const activity = new Activity(data)

      if (activity.lists.length != 0) {

        activity.lists.forEach(function(list) {
          $("#right-column-content").show()
          $("#right-column-content p").hide()
          $("#right-column-content").append(`<h4><p><a href="/activities/${activity.id}/lists/${list.id}"> ${list.name} </a></h4></p>`)
        })
      } else {
        // $("#right-column-content").html("You have no to-dos!") /// don't replace html ///
      }
      activity.setText()
      activity.setDataIds()
    })
  })
})

// Show To-Dos //
$(document).on("turbolinks:load", function() {
  $("#view-todo-button").on("click", function() {
    $("#far-right").hide()
    $("#show-edit-activity").hide()
    $("#show-add-to-do").hide()
    $("#show-to-dos").show()
    // $("right-column-content").show()
  })
})

// Show Add To-Do //
$(document).on("turbolinks:load", function() { ///new-list-form gone ///
  $("#add-todo-button").on("click", function() {
    $("#far-right").hide()
    $("#show-edit-activity").hide()
    $("#show-add-to-do").show()
    $("#new-list-form").show()
    $("#show-to-dos").hide()
    // $("#edit-activity").hide()
    // $("#show-lists").hide()
    // $("#new-list-form").show()
    // $("right-column-content").hide()
  })
})

// Post Request New List
$(document).on("turbolinks:load", function() {
  $("input#submit-new-list-button").on("click", function(e) {
    e.preventDefault()

    const activityId = parseInt($("#right").attr("data-id"))
    const values = $(`form#edit_activity_${activityId}`).serialize()

    const posting = $.ajax({
      url: `/activities/${activityId}`,
      data: values,
      type: 'PATCH',
      success: function(data) {
        $("#far-right").show()

        const farRightDiv = $("#far-right-column-content")
        const list = new List(data)
        farRightDiv.append(`<h4><p><a href="/activities/${list.activityId}/lists/${list.id}"> ${list.name} </a></h4></p>`)
      }
    })
    $("#lists_name").val("")
  })
})

// Show Edit Activity Form //
$(document).on("turbolinks:load", function() {
  $("#edit-drop-button").on("click", function() {
    $("#far-right").hide()
    $("#show-edit-activity").show()
    $("#edit-activity").show()
    $("#show-add-to-do").hide()
    $("#new-list-form").hide()
    $("#show-to-dos").hide()
  })
})

// Edit Form Submit //
$(document).on("turbolinks:load", function() {
  $("#edit-activity-button").on("click", function(e) {
    e.preventDefault()

    const activityId = parseInt($("#edit-activity").attr("data-id"))
    const values = $(`form#edit_activity_${activityId}`).serialize()

    const posting = $.ajax({
      url: `/activities/${activityId}`,
      data: values,
      type: 'PATCH',
      success: function(data) {
        // const activity = data
        // const farRightDiv = $("#far-right-column-content")
        location.reload()
      }
    })
  })
})
