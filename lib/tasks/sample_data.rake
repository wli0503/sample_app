require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
      10.times do |n|
        username = Faker::Name.name
        email = "example#{n + 1}@test.com"
        password = "111111"
        User.create!(
          :username => username,
          :email => email,
          :password => password,
          :password_confirmation => password,
          :admin => true)
      end
      
      User.all.each do |u|
        50.times do
          u.microposts.create!( \
            :content => Faker::Lorem.sentence(10) \
          )
      end
    end
  end
end