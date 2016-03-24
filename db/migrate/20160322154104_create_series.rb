class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :title
      t.text :synopsis

      t.timestamps null: false
    end
  end
end
