class FlightsController < ApplicationController
  def index
    params[:search] ||= {}
    @flights = Flight.search(params[:search])
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
