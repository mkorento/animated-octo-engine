class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name, null: false
      t.string :description
      t.string :file, null: false

      t.timestamps
    end
  end
end
