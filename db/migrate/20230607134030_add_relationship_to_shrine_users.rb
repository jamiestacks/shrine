class AddRelationshipToShrineUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :shrine_users, :relationship, :string
  end
end
