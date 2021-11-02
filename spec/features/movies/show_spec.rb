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

  it 'lists all movie actors and their attributes' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    ford = Actor.create!(name: 'Harrison Ford', age: 79)
    myers = Actor.create!(name: 'Mike Myers', age: 58)
    allen = Actor.create!(name: 'Karen Allen', age: 70)
    MovieActor.create!(movie: ark, actor: ford)
    MovieActor.create!(movie: ark, actor: allen)

    visit "/movies/#{ark.id}"

    expect(page).to have_content(ford.name)
    expect(page).to have_content(ford.age)
    expect(page).to have_content(allen.name)
    expect(page).to have_content(allen.age)
    expect(page).to_not have_content(myers.name)
  end

  it 'displays average age of actors' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    ford = Actor.create!(name: 'Harrison Ford', age: 79)
    myers = Actor.create!(name: 'Mike Myers', age: 58)
    allen = Actor.create!(name: 'Karen Allen', age: 70)
    MovieActor.create!(movie: ark, actor: ford)
    MovieActor.create!(movie: ark, actor: allen)

    visit "/movies/#{ark.id}"

    expect(page).to have_content("Average Age of Actors:")
    expect(page).to have_content(74.5)
  end

  it 'can add existing actors to movie' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    ford = Actor.create!(name: 'Harrison Ford', age: 79)
    pitt = Actor.create!(name: 'Brad Pitt', age: 57)
    allen = Actor.create!(name: 'Karen Allen', age: 70)
    MovieActor.create!(movie: ark, actor: ford)
    MovieActor.create!(movie: ark, actor: allen)

    visit "/movies/#{ark.id}"

    expect(page).to have_content("Add an Actor to this Movie:")
    expect(page).to have_button("Add Actor")

    fill_in 'Existing Actor Name', with: pitt.name
    click_button("Add Actor")

    visit "/movies/#{ark.id}"

    expect(page).to have_content(pitt.name)
  end
end