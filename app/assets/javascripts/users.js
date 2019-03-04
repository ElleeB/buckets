const userID = (button) => button.dataset.userId
const rightColumnDiv = () => $("#right-column-content")

// View All Drops Button //
$(document).on("turbolinks:load", function() {


  $("#all-drops-button").on('click', function() {
    $("#activities-form").hide()

    // clear right column and refill with new title
    rightColumnDiv().empty()
    rightColumnDiv().html("<h2>My Drops</h2>")

    $.get(`/users/${userID(this)}/activities`, function(data) {
      const activities = data
      activities.forEach(function(activity) {
        rightColumnDiv().append(
        `<ul><li><a href="../activities/${activity.id}">${activity.title}</a></li></ul>`
        )
      })
    })
  })
})

// Add A Drop Form Display //
$(document).on("turbolinks:load", function() {
  $("#add-drop-button").on("click", function() {
    $("#right-column-content").empty()
    $("#new_activity").show()

    rightColumnDiv().html("<h2>Add A Drop To Your Bucket!</h2>")

    const newActivityFormDiv = $("#activities-form")
    newActivityFormDiv.show()
  })
})

// Add Drop Post Request //
$(document).on("turbolinks:load", function() {
  $('input#submit-new-drop-button').on("click", function(event){
    event.preventDefault()

    // serialize form data + create post request
    const values = $('form').serialize()
    const posting = $.post("/activities", values)

    posting.done(function(data) {
      $('form').hide()

      const activity = new Activity(data)

      rightColumnDiv().html(activity.newUserActivityHtml())

      $('form')[0].reset()
    })
  })
})

// Show To Do Lists //
$(document).on("turbolinks:load", function() {
  $("#to-do-button").on('click', function() {
    $("#new_activity").hide()

    $.get(`/users/${userID(this)}/lists`, function(data) {
      if (data.length != 0) {
        const lists = data

        rightColumnDiv().empty()
        rightColumnDiv().html("<h2>My To Dos</h2>")

        lists.forEach(function(list) {
          rightColumnDiv().append(
          `<ul><li><a href="../lists/${list.id}">${list.name}</a></li></ul>`
          )
        })
      } else {
        rightColumnDiv().html("<h2>You Have No To-Do Lists</h2><p><a href='/activities'>click here to view drops and ad to-dos</a></p>")
      }
    })
  })
})
