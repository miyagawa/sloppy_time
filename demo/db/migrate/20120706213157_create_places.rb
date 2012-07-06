class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.boolean :active
      t.datetime :published_at

      t.timestamps
    end
  end
end
