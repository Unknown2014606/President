class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :gender
      t.integer :age
      t.integer :score
      t.references :video, index: true

      t.timestamps
    end
  end
end
