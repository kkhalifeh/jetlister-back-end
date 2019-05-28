class AddNoteToListPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :list_places, :note, :string
    remove_column :place_categories, :note
  end
end
