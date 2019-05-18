class AddListToPlaceCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :place_categories, :list, foreign_key: true
  end
end
