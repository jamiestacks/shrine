class CreateShrineUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :shrine_users do |t|
      t.references :shrine, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
