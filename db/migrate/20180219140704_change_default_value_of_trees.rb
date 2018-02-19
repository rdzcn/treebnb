class ChangeDefaultValueOfTrees < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:trees, :available, true)
  end
end
