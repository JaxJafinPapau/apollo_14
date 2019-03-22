require 'rails_helper'

RSpec.describe 'astronaut index workflow' do
  it 'should list astronauts with their info' do
    astronaut_1 = Astronaut.create(name: "John Glenn", age: 39, job: "Mission commander")
    astronaut_2 = Astronaut.create(name: "Peggy Whitson", age: 59, job: "Science officer")
    mission_1 = astronaut_1.missions.create(title: "Apollo 14", time_in_space: 14)
    mission_2 = astronaut_1.missions.create(title: "Gemini 7", time_in_space: 14)
    mission_3 = astronaut_1.missions.create(title: "Capricorn 11", time_in_space: 14)
    mission_4 = astronaut_2.missions.create(title: "Apollo 11", time_in_space: 15)
    mission_5 = astronaut_2.missions.create(title: "Skylab 1", time_in_space: 15)
    mission_6 = astronaut_2.missions.create(title: "Mercury 7", time_in_space: 15)

    visit astronauts_path

    expect(page).to have_content("#{astronaut_1.name}")
    expect(page).to have_content("#{astronaut_1.age}")
    expect(page).to have_content("#{astronaut_1.job}")
    expect(page).to have_content("#{astronaut_2.name}")
    expect(page).to have_content("#{astronaut_2.age}")
    expect(page).to have_content("#{astronaut_2.job}")
    expect(page).to have_content("Astronaut average age: 49")

    expect(page).to have_content("#{mission_1.title} #{mission_3.title} #{mission_2.title}")
    expect(page).to have_content("#{mission_4.title} #{mission_6.title} #{mission_5.title}")

    expect(page).to have_content("Time in space: 43")
    expect(page).to have_content("Time in space: 45")
  end
end
