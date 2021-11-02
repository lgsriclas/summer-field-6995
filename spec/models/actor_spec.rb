require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it { should have_many(:movie_actors) }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe 'age' do
    it 'shows average age of actors' do
      universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      ford = Actor.create!(name: 'Harrison Ford', age: 79)
      myers = Actor.create!(name: 'Mike Myers', age: 58)
      allen = Actor.create!(name: 'Karen Allen', age: 70)
      MovieActor.create!(movie: ark, actor: ford)
      MovieActor.create!(movie: ark, actor: allen)

      expect(ark.actors.average_age).to eq(74.5)
    end
  end
end