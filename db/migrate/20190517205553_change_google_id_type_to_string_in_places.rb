class ChangeGoogleIdTypeToStringInPlaces < ActiveRecord::Migration[5.2]
  def change
    change_column :places, :google_id, :string
  end
end
