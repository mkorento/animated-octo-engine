class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :name, null: false, limit: nil
      t.text :description, limit: nil
      t.string :file, null: false

      t.timestamps
    end
  end
end
