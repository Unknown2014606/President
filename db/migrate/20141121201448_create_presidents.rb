class CreatePresidents < ActiveRecord::Migration
  def change
    create_table :presidents do |t|
      t.string :name
      t.string :party
      t.integer :supportNo
      t.string :wiki

      t.timestamps
    end
  end
end
