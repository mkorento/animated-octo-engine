class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name, null: false
      t.string :description
      t.string :file

      t.timestamps
    end
  end
end
