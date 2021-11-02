require 'rails_helper'

RSpec.describe 'the movies show' do
  it 'lists all the movies and their attributes' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')

    visit "/movies/#{ark.id}"

    expect(page).to have_content(ark.title)
    expect(page).to have_content(ark.creation_year)
    expect(page).to have_content(ark.genre)
  end
end