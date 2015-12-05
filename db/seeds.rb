require 'faker'

#Create users
5.times do
  user = User.new(
    name:         Faker::Name.name,
    email:        Faker::Internet.email,
    password:     "helloworld"
  )
  user.skip_confirmation!
  user.save!
end

1.times do
  user = User.new(
    name:           'Josh',
    email:          'joshuaarnold22@gmail.com',
    password:       "helloworld",
    role:           'admin'
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

#Create Tasks
users.each do |user|
  5.times do
    Task.create!(
      name:         Faker::Lorem.sentence,
      user:         user,
      completed:    false
    )
  end
end
tasks = Task.all
