class AddSeasonToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :season, :integer
  end
end
