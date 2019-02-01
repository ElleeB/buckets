// View/Hide Activities Button Functionality
$(function() {
  $("#all-drops-button").on('click', function() {
    let div = $("#list-drops")
    // if button says view all drops
    if ($("#all-drops-button")[0].innerText === "View All Drops") {
      // if no drops visible
      if ($("#list-drops").empty()) {
        let userID = this.dataset.userId
        $.get(`/users/${userID}/activities`, function(data) {
          let activities = data
          activities.forEach(function(activity) {
            div.append(`<ul><li><a href="../activities/${activity.id}">${activity.title}</a></li></ul>`)
            //  change button text to 'hide my drops'
            $("#all-drops-button")[0].innerText = "Hide My Drops"
          })
        })
      }
    // if button says hide my drops and is clicked
    } else {
      // hide the activities listed
      $("#list-drops")[0].innerHTML = ""
      // reset button text
      $("#all-drops-button")[0].innerText = "View All Drops"
    }
  })
})
