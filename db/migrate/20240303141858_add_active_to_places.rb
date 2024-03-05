class AddActiveToPlaces < ActiveRecord::Migration[7.1]
  def change
    add_column :places, :active, :boolean, default: false
  end
end
