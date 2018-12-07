require "rails_helper"

describe 'Astronauts Index Page' do
  before :each do
    @a_1 = Astronaut.create!(name: 'Louie', age: 38, job: 'mechanic')
    @a_2 = Astronaut.create!(name: 'Bob', age: 45, job: 'surveyor')
    @a_3 = Astronaut.create!(name: 'Jane', age: 32, job: 'flag placer')
    @a_4 = Astronaut.create!(name: 'Lara', age: 41, job: 'photographer')
  end

  it 'should display all astronauts attributes' do
    visit "/astronauts"

    expect(page).to have_content(@a_1.name)
    expect(page).to have_content(@a_1.age)
    expect(page).to have_content(@a_1.job)

    expect(page).to have_content(@a_2.name)
    expect(page).to have_content(@a_2.age)
    expect(page).to have_content(@a_2.job)

    expect(page).to have_content(@a_3.name)
    expect(page).to have_content(@a_3.age)
    expect(page).to have_content(@a_3.job)

    expect(page).to have_content(@a_4.name)
    expect(page).to have_content(@a_4.age)
    expect(page).to have_content(@a_4.job)
  end

  it 'should show average age of all astronauts' do
    visit "/astronauts"

    sum_age = [@a_1, @a_2, @a_3, @a_4].reduce(0){|sum, a| sum += a.age}

    expect(page).to have_content(sum_age / 4)
  end
end
