class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :genre, index: true
      t.references :tagable, polymorphic: true, index: true
      t.timestamps null: false
    end
    add_foreign_key :tags, :genres
  end
end
