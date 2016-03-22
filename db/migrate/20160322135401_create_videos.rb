class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.integer :language
      t.integer :year
      t.text :synopsis

      t.timestamps null: false
    end
  end
end
