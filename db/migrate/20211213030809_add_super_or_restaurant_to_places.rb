class AddSuperOrRestaurantToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :supermarket, :string
  end
end
