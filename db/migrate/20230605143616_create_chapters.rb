class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.string :title
      t.date :date_start
      t.date :date_end
      t.references :shrine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
