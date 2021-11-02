require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it { should have_many(:movies) }
  end

  describe 'attributes' do
    it 'has attributes' do
      universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      mgm = Studio.create!(name: 'MGM', location: 'New York City')

      expect(universal.name).to eq("Universal Studios")
      expect(mgm.name).to eq("MGM")
      expect(universal.location).to eq("Hollywood")
      expect(mgm.location).to eq("New York City")
    end
  end

end
