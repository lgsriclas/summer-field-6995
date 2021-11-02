require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many(:movie_actors) }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe 'attributes' do
    it 'has attributes' do
      universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')

      expect(ark.title).to eq("Raiders of the Lost Ark")
      expect(ark.creation_year).to eq(1981)
      expect(ark.genre).to eq("Action/Adventure")
    end
  end
end
