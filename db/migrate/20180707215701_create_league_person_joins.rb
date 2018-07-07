class CreateLeaguePersonJoins < ActiveRecord::Migration
  def change
    create_table :league_person_joins do |t|
      t.references :league, index: true, null: false
      t.references :person, index: true, null: false

      t.timestamps
    end
  end
end
