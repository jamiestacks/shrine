class AddStatusToShrineUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :shrine_users, :status, :integer, default: 0
  end
end
