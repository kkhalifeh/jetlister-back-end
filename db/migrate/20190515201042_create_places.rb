class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.integer :google_id
      t.string :name
      t.string :img_url

      t.timestamps
    end
  end
end
