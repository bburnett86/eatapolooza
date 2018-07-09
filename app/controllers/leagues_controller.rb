class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def show 
    @league = League.find(params[:id])
  end

  def event
    @league = League.find(params[:league_id])
    @event = @league.events.find(params[:id])
  end
end
