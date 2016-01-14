class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :nickname, null: false
      t.text :content, null: false
      t.belongs_to :image, index: true, null: false

      t.timestamps
    end
  end
end
