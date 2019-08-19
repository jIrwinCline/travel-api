class Seed

  def self.begin
    Place.destroy_all
    Review.destroy_all
    seed = Seed.new
    seed.generate_places
  end

  def generate_places
    20.times do |a|
      place = Place.create ({
        name: Faker::Address.city
        })
        rand(3..7).times do |x|
          review = place.reviews.create!({
            user_name: Faker::Hipster.words,
            text: Faker::Hipster.paragraph
            })
        end
        puts "Places #{a}: Name is #{place.name}."
    end
  end
end

 Seed.begin
