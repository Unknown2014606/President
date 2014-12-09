class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :topic
      t.string :president
      t.string :embed
      t.string :pic

      t.timestamps
    end
  end
end
