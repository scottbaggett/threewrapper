# SQLEditor export: Rails Migration
# id columns are removed
class CreateEpisodes < ActiveRecord::Migration 
  def self.up
    create_table :episodes do |t|
      t.string :name
      t.date :published_on
      t.string :cover_image
      t.integer :num
      t.references :series
      t.string :artist
      t.column :slug, :string
    end

    add_index :episodes, :slug

    create_table :tracks do |t|
      t.integer :position
      t.string :title
      t.integer :slug
      t.string :artist
      t.references :episodes
    end

  end

  def self.down
    drop_table :episodes
    drop_table :tracks
  end
end
