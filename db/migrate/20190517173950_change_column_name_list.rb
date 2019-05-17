class ChangeColumnNameList < ActiveRecord::Migration[5.2]
  def change
    rename_column :lists, :pins, :pinned
  end
end
