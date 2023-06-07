class AddFamilyNameToShrines < ActiveRecord::Migration[7.0]
  def change
    add_column :shrines, :family_name, :string
  end
end
