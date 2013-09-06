require 'faker'

5.times do
  User.create :email => Faker::Internet.email, :password => 'password'
end

5.times do
  Participant.create :name => Faker::Name.name, :age => rand(21..80), :gender => rand(0..1)
end
