class CreateEventLeagueJoins < ActiveRecord::Migration
  def change
    create_table :event_league_joins do |t|

      t.timestamps
    end
  end
end
