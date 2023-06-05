class CreateShrines < ActiveRecord::Migration[7.0]
  def change
    create_table :shrines do |t|
      t.string :name
      t.date :DOB
      t.date :DOD

      t.timestamps
    end
  end
end
