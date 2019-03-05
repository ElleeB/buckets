// List Prototype //
function List(data) {
  this.id = data.id
  this.name = data.name
  this.activityId = data.activity_id
  this.userId = data.user_id
}

List.prototype.usersListsHTML = function() {
  return `<h4><p><a href="/activities/${this.activity.id}/lists/${this.id}"> ${this.name} </a></h4></p>`
}
