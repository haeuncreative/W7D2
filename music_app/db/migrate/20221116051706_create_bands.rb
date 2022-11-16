class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.string :name, null: false, unique: true, index: true
      t.string :genre
      t.string :status
      t.timestamps
    end
  end
end
