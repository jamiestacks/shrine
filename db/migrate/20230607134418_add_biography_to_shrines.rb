class AddBiographyToShrines < ActiveRecord::Migration[7.0]
  def change
    add_column :shrines, :biography, :text
  end
end
