$(function() {
  $("#all-drops").on('click', function(event) {
    let userID = this.dataset.userId
    $.get(`/users/${userID}/activities`, function(data) {
      let activities = data
      let div = $("#show-drop-button")
      activities.forEach(function(activity) {
        div.append(`<ul><li>${activity.title}</li></ul>`)
        // need to ensure that it doesn't repeat append
      })
    })
  })
})
