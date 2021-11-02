require 'rails_helper'

RSpec.describe 'the studios index' do
  it 'lists all the studios and their locations' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    mgm = Studio.create!(name: 'MGM', location: 'New York City')

    visit "/studios"

    expect(page).to have_content(universal.name)
    expect(page).to have_content(universal.location)
  end
end