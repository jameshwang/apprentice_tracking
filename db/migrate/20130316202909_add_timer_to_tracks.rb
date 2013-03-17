class AddTimerToTracks < ActiveRecord::Migration
  def change
  	add_column :tracks, :timer, :integer
  end
end
