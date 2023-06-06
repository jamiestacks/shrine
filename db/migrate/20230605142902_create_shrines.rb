class CreateShrines < ActiveRecord::Migration[7.0]
  def change
    create_table :shrines do |t|
      t.string :name
      t.date :dob
      t.date :dod
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
