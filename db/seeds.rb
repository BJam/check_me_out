User.create!(first_name:  "Test",
             last_name:   "Admin",
             email:       "test@gmail.com",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)


25.times do |n|
  first_name  = Faker::Name.first_name
  last_name   = Faker::Name.last_name
  email = "test-#{n+1}@gmail.com"
  password = "password"
  User.create!(first_name:  first_name,
               last_name:   last_name,
               email:       email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

user = User.first
3.times do
  name = ["iphone", "droid", "motox", "galaxy"].sample
  status = "Checked Out"
  user.devices.create!(name: name, status: status)
end

user = User.second
2.times do
  name = ["iphone2", "droid2", "motox2", "galaxy2"].sample
  status = "Checked Out"
  user.devices.create!(name: name, status: status)
end

4.times do
  name = ["iphone3", "droid3", "motox3", "galaxy3"].sample
  status = "Available"
  Device.create!(name: name, status: status)
end