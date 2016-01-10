class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :nickname, null: false
      t.string :content, null: false
      t.belongs_to :image, index: true, null: false

      t.timestamps
    end
  end
end
