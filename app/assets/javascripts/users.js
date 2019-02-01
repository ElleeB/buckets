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
            // need to ensure that it doesn't repeat append
            //  + turn innerText into 'hide my drops'
            $("#all-drops-button")[0].innerText = "Hide My Drops"
          })
        })
      }
    // if button says hide my drops
    } else {
      $("#list-drops")[0].innerHTML = ""
      $("#all-drops-button")[0].innerText = "View All Drops"
    }
  })
})
