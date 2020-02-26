# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
puts 'Destroying Seeds'
Booking.destroy_all
WorkHistory.destroy_all
Skill.destroy_all
User.destroy_all

puts "Creating seeds"

PROVIDERS = []
BOOKERS = []
PSKILLS = []





3.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "123123",
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    city: Faker::Address.city,
    bio: Faker::Hipster.paragraphs
    )
  PROVIDERS << user


  skill = Skill.create!(
    name: Faker::Educator.degree,
    description: Faker::TvShows::TheFreshPrinceOfBelAir.quote,
    user: user
    )
  PSKILLS << skill

  WorkHistory.create!(
    company_name: Faker::Company.name,
    description: Faker::Movies::HarryPotter.quote,
    start_date: Date.today,
    end_date: Date.today + rand(100..10000),
    job_title: Faker::Job.title,
    user: user
    )
end

3.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "123123",
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    city: Faker::Address.city,
    bio: Faker::Hipster.paragraphs
    )
  BOOKERS << user


  Skill.create!(
    name: Faker::Educator.degree,
    description: Faker::TvShows::TheFreshPrinceOfBelAir.quote,
    user: user
    )

  WorkHistory.create!(
    company_name: Faker::Company.name,
    description: Faker::Movies::HarryPotter.quote,
    start_date: Date.today,
    end_date: Date.today + rand(100..10000),
    job_title: Faker::Job.title,
    user: user
    )
end

3.times do
  start_time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  Booking.create!(
    date: Date.today - rand(1..10),
    start_time: start_time,
    end_time: start_time + rand(1..2).hours,
    status: ['accepted', 'rejected', 'pending'].sample,
<<<<<<< HEAD
    skill: PSKILLS.sample,
    user: BOOKERS.sample,
=======
    skill: Skill.all.sample,
    user: user,
>>>>>>> 556a20f0e17782c4269f0e7ef25a6a085dc866b4
    user_comment: Faker::TvShows::Simpsons.quote,
    provider_comment: Faker::TvShows::Simpsons.quote
    )
  end

puts 'finished'


