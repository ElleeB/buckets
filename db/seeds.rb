# Users

User.create(
  name: "Sansa",
  username: "ladywolf",
  email: "lady@gmail.com",
  password: "lemoncakes",
  password_confirmation: "lemoncakes",
  image: "/assets/sansa-stark.jpg",
  about: "I love Geoffrey"
)

User.create(
  name: "Arya",
  username: "A Girl",
  email: "needle@gmail.com",
  password: "nymeria",
  password_confirmation: "nymeria",
  image: "/assets/arya-stark.jpg",
  about: "I hate Geoffrey"
)

User.create(
  name: "Ygritte",
  username: "touchedbyfire",
  email: "knowingnothing@gmail.com",
  password: "nothing",
  password_confirmation: "nothing",
  image: "/assets/ygritte.jpg",
  about: "I love Jon"
)

# Bucket Items

Activity.create(
  user_id: 2,
  title: "Kill Cersei",
  description: "Kill that crazy witch",
  due_date: DateTime.strptime('09/14/2018', '%m/%d/%Y')
  )

Activity.create(
  user_id: 2,
  title: "Become No One",
  description: "Become a badass nobody",
  due_date: DateTime.strptime('03/2/2019', '%m/%d/%Y')
  )

Activity.create(
  user_id: 3,
  title: "Give It To Jon",
  description: "Make sweets in the caves",
  due_date: DateTime.strptime('10/1/2018', '%m/%d/%Y')
  )

Activity.create(
  user_id: 3,
  title: "Destroy The Watch",
  description: "Welp, that didn't really work out with Jon",
  due_date: DateTime.strptime('09/30/2019', '%m/%d/%Y')
  )

Activity.create(
  user_id: 1,
  title: "Become a Princess",
  description: "Marry Geoffrey and be a princess",
  due_date: DateTime.strptime('12/28/2018', '%m/%d/%Y')
  )

Activity.create(
  user_id: 1,
  title: "Divorce Tyrion",
  description: "This wasn't how it was supposed to happen. Now I need to find a way out of this shit",
  due_date: DateTime.strptime('10/4/2018', '%m/%d/%Y')
  )

List.create(
  name: "to-do list 1",
  activity_id: 1,
  user_id: 2
)

List.create(
  name: "to-do list 2",
  activity_id: 1,
  user_id: 2
)

List.create(
  name: "to-do list 1",
  activity_id: 2,
  user_id: 2
)

List.create(
  name: "to-do list 2",
  activity_id: 2,
  user_id: 2
)

List.create(
  name: "to-do list 1",
  activity_id: 3,
  user_id: 3
)

List.create(
  name: "to-do list 2",
  activity_id: 3,
  user_id: 3
)

List.create(
  name: "to-do list 1",
  activity_id: 4,
  user_id: 3
)

List.create(
  name: "to-do list 2",
  activity_id: 4,
  user_id: 3
)

List.create(
  name: "to-do list 1",
  activity_id: 5,
  user_id: 1
)

List.create(
  name: "to-do list 2",
  activity_id: 5,
  user_id: 1
)

List.create(
  name: "to-do list 1",
  activity_id: 6,
  user_id: 1
)

List.create(
  name: "to-do list 2",
  activity_id: 6,
  user_id: 1
)

Item.create(
  name: "item 1",
  list_id: 1,
  user_id: 2,
  activity_id: 1
)

Item.create(
  name: "item 2",
  list_id: 1,
  user_id: 2,
  activity_id: 1
)

Item.create(
  name: "item 3",
  list_id: 1,
  user_id: 2,
  activity_id: 1
)

Item.create(
  name: "item 4",
  list_id: 1,
  user_id: 2,
  activity_id: 1
)

Item.create(
  name: "item 1",
  list_id: 3,
  user_id: 2,
  activity_id: 2
)

Item.create(
  name: "item 2",
  list_id: 3,
  user_id: 2,
  activity_id: 2
)

Item.create(
  name: "item 3",
  list_id: 3,
  user_id: 2,
  activity_id: 2
)

Item.create(
  name: "item 1",
  list_id: 6,
  user_id: 3,
  activity_id: 3
)

Item.create(
  name: "item 2",
  list_id: 6,
  user_id: 3,
  activity_id: 3
)

Item.create(
  name: "item 3",
  list_id: 6,
  user_id: 3,
  activity_id: 3
)

Item.create(
  name: "item 4",
  list_id: 6,
  user_id: 3,
  activity_id: 3
)

Item.create(
  name: "item 5",
  list_id: 6,
  user_id: 3,
  activity_id: 3
)

Item.create(
  name: "item 1",
  list_id: 7,
  user_id: 3,
  activity_id: 4
)

Item.create(
  name: "item 2",
  list_id: 7,
  user_id: 3,
  activity_id: 4
)

Item.create(
  name: "item 3",
  list_id: 7,
  user_id: 3,
  activity_id: 4
)

Item.create(
  name: "item 1",
  list_id: 9,
  user_id: 1,
  activity_id: 5
)

Item.create(
  name: "item 2",
  list_id: 9,
  user_id: 1,
  activity_id: 5
)

Item.create(
  name: "item 3",
  list_id: 9,
  user_id: 1,
  activity_id: 5
)

Item.create(
  name: "item 1",
  list_id: 10,
  user_id: 1,
  activity_id: 5
)

Item.create(
  name: "item 1",
  list_id: 11,
  user_id: 1,
  activity_id: 6
)

Item.create(
  name: "item 2",
  list_id: 11,
  user_id: 1,
  activity_id: 6
)

Item.create(
  name: "item 1",
  list_id: 12,
  user_id: 1,
  activity_id: 6
)
