class FixColumnNameInPlaces < ActiveRecord::Migration[6.0]
  def change
    rename_column :places, :type, :cuisine
  end
end
