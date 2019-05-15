class ChangeTypeLongLatLocation < ActiveRecord::Migration[5.2]
  def change
    change_column :locations, :latitude, :decimal, :precision => 15, :scale => 13
    change_column :locations, :longitude, :decimal, :precision => 15, :scale => 13
  end
end
