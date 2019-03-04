// Activity Prototype //
// Three 'main' possible syntax structures to define js model object //
// Below = constructor fx syntax //
// Research class syntax //
// or Factory function (doesn't use the new keyword) //
function Activity(data) {
  this.dueDate = data.activity.due_date
  this.title = data.activity.title
  this.categoryName = data.activity_category
  this.description = data.activity.description
  this.lists = data.activity.lists
  this.countdown = data.countdown
  // console.log(this)
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


    const nextId = parseInt($(".js-next").attr("data-id")) + 1

    $.get("/activities/" + nextId + ".json", function(data) {
      // console.log(data)
      const activity = new Activity(data)
//    Activity {dueDate: "2019-11-11T00:00:00.000Z", title: "Become Queen in The North", categoryName: "Lifestyle", description: "Move out of the way, Jon!", lists: undefined}
        // categoryName: "Lifestyle"
        // description: "Move out of the way, Jon!"
        // dueDate: "2019-11-11T00:00:00.000Z"
        // lists: undefined
        // title: "Become Queen in The North"
      if (activity.lists) {
        $("#right-column-content").html("<h2> Drop To Dos </h2>")
        activity.lists.forEach(function(list) {
          $("#right-column-content").append(`<h4><p><a href="/activities/${["activity"]["id"]}/lists/${list.id}"> ${list.name} </a></h4></p>`)
        })
      } else {
        $("#right-column-content").html("You have no to-dos!")
      }

      $("#activityTitle").text(activity.title)
      $("#categoryName").text(activity.categoryName)
      $("#description").text(activity.description)
      $("#dueDate").text(activity.formatDate())
      $("#pastDue").text(activity["countdown"])

      // set the data id to current activity
      $(".js-next").attr("data-id", activity["activity"]["id"])
      $(".js-previous").attr("data-id", activity["activity"]["id"])
      $("#new-list-form").attr("data-id", activity["activity"]["id"])
      console.log($("#new-list-form").attr("data-id"))
      // activity data-id seems to be updating appropriately
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

    $.get("/activities/" + previousId + ".json", function(data) { ////////////
      const activity = data
      console.log("after get previous activity = ", data)
      const newActivity = new Activity(activity["activity"]["due_date"])
      const activityLists = activity["activity_lists"]

      if (activityLists.length != 0) {
        $("#right-column-content").html("<h2> Drop To Dos </h2>")
        activityLists.forEach(function(list) {
          $("#right-column-content").append(`<h4><p><a href="/activities/${activity["activity"]["id"]}/lists/${list.id}"> ${list.name} </a></h4></p>`)
        })
      } else {
        $("#right-column-content").html("You have no to-dos!")
      }

      $("#activityTitle").text(activity["activity"]["title"])
      $("#categoryName").text(activity["activity_category"])
      $("#description").text(activity["activity"]["description"])
      $("#dueDate").text(newActivity.formatDate)
      $("#pastDue").text(activity["countdown"])

      // set the data id to current activity
      $(".js-previous").attr("data-id", activity["activity"]["id"])
      $(".js-next").attr("data-id", activity["activity"]["id"])
      $("#new-list-form").attr("data-id", activity["activity"]["id"])
      console.log($("#new-list-form").attr("data-id"))
      // activity data-id seems to be updating appropriately
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

    const activityId = parseInt($("#new-list-form").attr("data-id"))
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
