# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
puts 'Destroying Seeds'
User.destroy_all
Skill.destroy_all
WorkHistory.destroy_all
Booking.destroy_all

puts "Creating users"

3.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "123123",
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    city: Faker::Address.city,
    bio: Faker::Hipster.paragraphs
    )

  Skill.create!(
    name: Faker::Educator.degree,
    description: Faker::TvShows::TheFreshPrinceOfBelAir.quote,
    user: user
    )

  WorkHistory.create!(
    company_name: Faker::Company,
    description: Faker::Movies::HarryPotter.quote,
    start_date: Date.today,
    end_date: Date.today + rand(1..10),
    job_title: Faker::Job.title,
    user: user
    )

3.times do
  start_time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  Booking.create!(
    date: Date.today - rand(1..10),
    start_time: start_time,
    end_time: start_time + rand(1..2).hours,
    status: ['acepted', 'rejected', 'pending'].sample,
    skill: Skill.all.sample,
    user: user
    )
  end
end

puts 'finished'
# 10.times do
#   .create(Faker::Educator.degree)


# Faker::Date.between(2.days.ago, Date.today)
# Faker::Time.between(DateTime.now - 1, DateTime.now)



# puts "creating hosts..."
# 10.times do
#   url = open('http://le-wagon-tokyo.herokuapp.com/batches/363/student').read
#   Host.create!(
#     name: Faker::Name.name,
#     infected_on: (Date.today - rand(1..10)),
#     image_url: url,
#     virus: virus
#   )
# end



