require "open-uri"
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
puts 'Destroying Seeds'
Booking.destroy_all
WorkHistory.destroy_all
Skill.destroy_all
User.destroy_all

puts "Creating seeds"


START_TIME = Faker::Time.forward(days: 10, period: :morning)


# creating test owners and bookers

HIRO = User.create!(
  email: "hiro@gmail.com",
  password: "123123",
  first_name: "Hiroki",
  second_name: "Kameyama",
  city: "Tokyo",
  bio: "I worked as finance/sales roles in a video game industry for several years but wanted to drastically change my career and so have decided to join Le Wagon. My goal here is to learn coding skills to develop web services/apps on my own."
)

hirofile = URI.open('https://res.cloudinary.com/dopoqpdhm/image/upload/v1582854043/hiro.jpg')
HIRO.photo.attach(io: hirofile, filename: 'hiro.jpg', content_type: 'image/jpg')

YUKA = User.create!(
  email: "yuka@gmail.com",
  password: "123123",
  first_name: "Yuka",
  second_name: "Takiyama",
  city: "Tokyo",
  bio: "I work as a flight attendant. I worked in the service industry all the time, but I wanted to get the skill.
I would like to learn coding and hope to come back to the ground."
)

yukafile = URI.open('https://res.cloudinary.com/dopoqpdhm/image/upload/v1582854470/yuka.jpg')
YUKA.photo.attach(io: yukafile, filename: 'yuka.jpg', content_type: 'image/jpg')


#Creating test skills


accounting = Skill.create!(
  name: "Accounting",
  description: "Realigned financial reporting processes for client company, ensuring their first on-time submission of federal tax documents in four years and laying strong groundwork for future audit-free filings.",
  user: HIRO
  )

skills = [{
  name: "Budgeting",
  description: "Achieved budget reduction of approximately ten percent through improved IT expenditures and support, reductions in consultant contracts and unnecessary travel expenditures.",
  user: HIRO
},
{
  name: "CSS",
  description: "Created 15+ websites using CSS, HTML, ASP, ASP.net, PHP, and JavaScript, from design to delivery",
  user: YUKA
},
{
  name: "Java Script",
  description: "Converted designs in Photoshop to responsive web pages using HTML5, CSS, Javascript and jQuery.",
  user: YUKA
},
{
  name: "Ruby on rails",
  description: "Developed an application as a full-stack web developer using AngularJS, Firebase, Node.js, D3.js, HTML/CSS",
  user: YUKA
}
]

Skill.create!(skills)


#creating test work histroy

WorkHistory.create!(
    company_name: "Nintendo",
    description: "I worked as finance/sales roles.",
    start_date: Date.today - rand(100..10000),
    end_date: Date.today - rand(99),
    job_title: "Assistant Manager",
    user: HIRO
)

WorkHistory.create!(
  company_name: "Lufthansa",
  description: "I fly between Japan and Germany",
  start_date: Date.today - rand(100..10000),
  end_date: Date.today - rand(99),
  job_title: "Flight Attendant",
  user: YUKA
)


#creating random users

SKILL_NAMES = ["CSS" "Java Script", "Accounting", "Budgeting"]
PROVIDERS = []
BOOKERS = []
PSKILLS = []

PHOTOS_URLS= [ "https://avatars0.githubusercontent.com/u/21108437?s=400&v=4",
  "https://avatars0.githubusercontent.com/u/25542223?s=400&v=4",
  "https://avatars1.githubusercontent.com/u/56534210?s=400&v=4",
  "https://avatars0.githubusercontent.com/u/35246097?s=400&v=4",
  "https://avatars3.githubusercontent.com/u/42826652?s=400&v=4",
  "https://avatars3.githubusercontent.com/u/47935870?s=400&v=4",
  "https://avatars3.githubusercontent.com/u/31160338?s=400&v=4",
  "https://avatars0.githubusercontent.com/u/6465116?s=400&v=4",
  "https://avatars1.githubusercontent.com/u/26819547?s=400&v=4"
  ]

PHOTOS_URLS_2 = [ "https://avatars0.githubusercontent.com/u/59479470?s=400&v=4",
  "https://avatars0.githubusercontent.com/u/58677059?s=400&v=4",
  "https://avatars0.githubusercontent.com/u/59574812?s=400&v=4",
  "https://avatars3.githubusercontent.com/u/58992961?s=400&v=4",
  "https://avatars0.githubusercontent.com/u/40887017?s=400&v=4",
  "https://avatars0.githubusercontent.com/u/58676941?s=400&v=4"
]

PHOTOS_URLS.each do |url|

  provider = User.create!(
    email: Faker::Internet.email,
    password: "123123",
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    city: Faker::Address.city,
    bio: Faker::TvShows::SiliconValley.quote
    )

  file = URI.open(url)
  provider.photo.attach(io: file, filename: 'provider.jpg', content_type: 'image/jpg')


  PROVIDERS << provider

  skill = Skill.create!(
    name: "Ruby on rails",
    description: Faker::TvShows::SiliconValley.motto,
    user: provider
    )

  PSKILLS << skill

  skill = Skill.create!(
    name: SKILL_NAMES.sample,
    description: Faker::TvShows::SiliconValley.motto,
    user: provider
    )

  PSKILLS << skill

  WorkHistory.create!(
    company_name: Faker::Company.name,
    description: Faker::Movies::HarryPotter.quote,
    start_date: Date.today - rand(100..10000),
    end_date: Date.today - rand(99),
    job_title: Faker::Job.title,
    user: provider
    )
end

PHOTOS_URLS_2.each do |url|

  booker = User.create!(
    email: Faker::Internet.email,
    password: "123123",
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    city: Faker::Address.city,
    bio: Faker::TvShows::SiliconValley.quote
    )

  file = URI.open(url)
  booker.photo.attach(io: file, filename: 'booker.jpg', content_type: 'image/jpg')

  BOOKERS << booker

  Skill.create!(
    name: "Ruby on rails",
    description: Faker::TvShows::SiliconValley.motto,
    user: booker
  )

  Skill.create!(
    name: SKILL_NAMES.sample,
    description: Faker::TvShows::SiliconValley.motto,
    user: booker
  )

  WorkHistory.create!(
    company_name: Faker::Company.name,
    description: Faker::Movies::HarryPotter.quote,
    start_date: Date.today - rand(100..10000),
    end_date: Date.today - rand(99),
    job_title: Faker::Job.title,
    user: booker
    )
end


# Creating test booking of HIRO as a provider


Booking.create!(
  date: Date.today + 1,
  start_time: START_TIME,
  end_time: START_TIME + rand(1..2).hours,
  status: 'accepted',
  skill: accounting,
  user: PROVIDERS.sample,
  user_comment: "I was looking for a person who has a experience of accounting in game industry.",
  provider_comment: "I'm glad to help for that."
)

Booking.create!(
  date: Date.today + 1,
  start_time: START_TIME,
  end_time: START_TIME + rand(1..2).hours,
  status: 'accepted',
  skill: PSKILLS.sample,
  user: YUKA,
  user_comment: "I'm looking forward to seeing you",
  provider_comment: "Me too!"
)



40.times do
  Booking.create!(
    date: Date.today + rand(1..10),
    start_time: START_TIME,
    end_time: START_TIME + rand(1..2).hours,
    status: ['accepted', 'rejected', 'pending'].sample,
    skill: PSKILLS.sample,
    user: BOOKERS.sample,
    user_comment: Faker::TvShows::Simpsons.quote,
    provider_comment: Faker::TvShows::Simpsons.quote
    )
  end

puts 'finished'


