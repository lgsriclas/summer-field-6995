require 'rails_helper'

RSpec.describe 'the studios index' do
  it 'lists all the studios and their locations' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    mgm = Studio.create!(name: 'MGM', location: 'New York City')

    visit "/studios"

    expect(page).to have_content(universal.name)
    expect(page).to have_content(universal.location)
  end

  it 'lists all studio movies' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    mgm = Studio.create!(name: 'MGM', location: 'New York City')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    shrek = universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')
    oz = mgm.movies.create!(title: 'The Wizard of Oz', creation_year: 1939, genre: 'Musical')

    visit "/studios"

    expect(page).to have_content(ark.title)
    expect(page).to have_content(shrek.title)
    expect(page).to have_content(oz.title)
  end
end