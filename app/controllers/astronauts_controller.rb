class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @average_age = Astronaut.average(:age)
    @missions = Missions.order(:title)
  end
end
