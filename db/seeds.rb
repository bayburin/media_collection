# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
user = User.create(
  email: "first_user@email.com",
  username: "petrov",
  password: "12345678"
)
Item.create!(
  user_id: user.id,
  description: "Мой первый пункт коллекции",
  link: "http://testlink.ru"
)
Item.create!(
  user_id: user.id,
  description: "Мой второй пункт коллекции",
  link: "http://google.com"
)

User.create(
  email: "sec_user@email.com",
  username: "ivanov",
  password: "qwertyui"
)
