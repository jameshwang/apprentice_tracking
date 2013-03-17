class AddTimerToTracks < ActiveRecord::Migration
  def change
  	add_column :tracks, :timer, :integer, :default => 0
  end
end
