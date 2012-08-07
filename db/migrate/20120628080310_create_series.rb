class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :name
      t.string :slug
      t.string :cover_image
      t.timestamps
    end

    add_index :series, :slug
  end
end
