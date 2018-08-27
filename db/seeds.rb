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
  description: "Kill that crazy brother humping biatch",
  due_date: DateTime.strptime('09/14/4932', '%m/%d/%Y')
  )
