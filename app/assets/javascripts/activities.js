// Activity Prototype //
// Three 'main' possible syntax structures to define js model object //
// Below = constructor fx syntax //
// Research class syntax //
// or Factory function (doesn't use the new keyword) //
function Activity(data) {
  this.id = data.activity.id
  this.dueDate = data.activity.due_date
  this.title = data.activity.title
  this.categoryName = data.activity_category
  this.description = data.activity.description
  this.lists = data.activity.lists
  this.countdown = data.countdown
}

Activity.prototype.newUserActivityHtml = function () {
  return `<h2>Your Newest Drop!</h2><p>${this.title}</p><p>${this.categoryName}</p><p>${this.description}</p><p>${this.formatDate()}</p>`
}

Activity.prototype.formatDate = function() {
    // create new date object with the current activity's due date
    let date = new Date(this.dueDate).toDateString()
    let dateB = date.split(' ')

    dateB.splice(1, 0, ", ")
    let dateC = dateB.join(" ")

    let dateD = dateC.split(" ")
    dateD.splice(5, 0, ", ")
    // removes the day and its comma
    dateD.splice(0,3)

    return dateD.join(" ")
  }

// Next Activity //
$(document).on("turbolinks:load", function() {
  $(".js-next").on("click", function(e) {
    e.preventDefault()

    $("#new-list-form").hide()
    $("#edit-activity").hide()
    $("#far-right").hide()
    $("#right-column-content").empty()

    const previousId = parseInt($(".js-next").attr("data-id")) + 1

    $.get("/activities/" + previousId + ".json", function(data) {
      // console.log(data)
      const activity = new Activity(data)

      if (activity.lists != undefined) {
        $("#right-column-content").html("<h2> Drop To Dos </h2>")
        activity.lists.forEach(function(list) {
          $("#right-column-content").append(`<h4><p><a href="/activities/${activity.id}/lists/${list.id}"> ${list.name} </a></h4></p>`)
        })
      } else {
        $("#right-column-content").html("You have no to-dos!")
      }

      $("#activityTitle").text(activity.title)
      $("#categoryName").text(activity.categoryName)
      $("#description").text(activity.description)
      $("#dueDate").text(activity.formatDate())
      $("#pastDue").text(activity.countdown)

      // set the data id to current activity
      $(".js-next").attr("data-id", activity.id)
      $(".js-previous").attr("data-id", activity.id)
      $("div#right").attr("data-id", activity.id)
    })
  })
})

// Previous Activity //
$(document).on("turbolinks:load", function() {
  $(".js-previous").on("click", function(e) {
    e.preventDefault()

    $("#new-list-form").hide()
    $("#edit-activity").hide()
    $("#far-right").hide()
    $("#right-column-content").empty()

    const previousId = parseInt($(".js-previous").attr("data-id")) - 1

    $.get("/activities/" + previousId + ".json", function(data) {
      // console.log(data)
      const activity = new Activity(data)

      if (activity.lists != undefined) {
        $("#right-column-content").html("<h2> Drop To Dos </h2>")
        activity.lists.forEach(function(list) {
          $("#right-column-content").append(`<h4><p><a href="/activities/${activity.id}/lists/${list.id}"> ${list.name} </a></h4></p>`)
        })
      } else {
        $("#right-column-content").html("You have no to-dos!")
      }

      $("#activityTitle").text(activity.title)
      $("#categoryName").text(activity.categoryName)
      $("#description").text(activity.description)
      $("#dueDate").text(activity.formatDate())
      $("#pastDue").text(activity.countdown)

      // set the data id to current activity
      $(".js-next").attr("data-id", activity.id)
      $(".js-previous").attr("data-id", activity.id)
      $("div#right").attr("data-id", activity.id)
    })
  })
})

// View Drop To-Dos //
$(document).on("turbolinks:load", function() {
  $("#view-todo-button").on("click", function() {
    $("#new-list-form").hide()
    $("#edit-activity").hide()
    $("#show-lists").show()
    $("right-column-content").show()
  })
})

// Add to do list //
$(document).on("turbolinks:load", function() {
  $("#add-todo-button").on("click", function() {
    $("right-column-content").hide()
    $("#edit-activity").hide()
    $("#show-lists").hide()
    $("#new-list-form").show()
  })
})

// Post Request New List
$(document).on("turbolinks:load", function() {
  // NEED TO BE SURE THE PATCH IS POSTING TO CORRECT ACTIVITY
  $("input#submit-new-list-button").on("click", function(e) {
    e.preventDefault()

    const activityId = parseInt($("#right").attr("data-id"))
    const values = $(`form#edit_activity_${activityId}`).serialize()
    const posting = $.ajax({
      url: `/activities/${activityId}`,
      data: values,
      type: 'PATCH',
      success: function(data) {
        const activity = data
        const lists = data["activity_lists"]
        $("#far-right").show()

        const farRightDiv = $("#far-right-column-content")
        farRightDiv.empty()
        lists.forEach(function(list) {
          console.log(list)
          farRightDiv.append(`<h4><p><a href="/activities/${activity["activity"]["id"]}/lists/${list.id}"> ${list.name} </a></h4></p>`)
        })
      }
    })
    $("#lists_name").val("")
  })
})

// Edit Form Show //
$(document).on("turbolinks:load", function() {
  $("#edit-drop-button").on("click", function() {
    $("#new-list-form").hide()
    $("right-column-content").hide()
    $("#show-lists").hide()
    $("#edit-activity").show()
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
        const activity = data
        const farRightDiv = $("#far-right-column-content")
        location.reload()
      }
    })
  })
})
