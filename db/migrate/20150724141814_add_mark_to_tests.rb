class AddMarkToTests < ActiveRecord::Migration
  def change
    add_column :tests, :mark, :string
  end
end
