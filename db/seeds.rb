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

BucketItem.create(
  user_id: "2",
  title: "Kill Cersei",
  description: "Kill that crazy witch",
  due_date: DateTime.strptime('09/14/2018', '%m/%d/%Y')
  )

BucketItem.create(
  user_id: "2",
  title: "Become No One",
  description: "Become a badass nobody",
  due_date: DateTime.strptime('03/2/2019', '%m/%d/%Y')
  )

BucketItem.create(
  user_id: "3",
  title: "Give It To Jon",
  description: "Make sweets in the caves",
  due_date: DateTime.strptime('10/1/2018', '%m/%d/%Y')
  )

BucketItem.create(
  user_id: "3",
  title: "Destroy The Watch",
  description: "Welp, that didn't really work out with Jon",
  due_date: DateTime.strptime('09/30/2019', '%m/%d/%Y')
  )

BucketItem.create(
  user_id: "1",
  title: "Become a Princess",
  description: "Marry Geoffrey and be a princess",
  due_date: DateTime.strptime('12/28/2018', '%m/%d/%Y')
  )

BucketItem.create(
  user_id: "1",
  title: "Divorce Tyrion",
  description: "This wasn't how it was supposed to happen. Now I need to find a way out of this shit",
  due_date: DateTime.strptime('10/4/2018', '%m/%d/%Y')
  )

ToDoList.create(
  bucket_item_id: 1
)

ToDoList.create(
  bucket_item_id: 2
)

ToDoList.create(
  bucket_item_id: 3
)
