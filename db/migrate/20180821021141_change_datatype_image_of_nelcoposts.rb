class ChangeDatatypeImageOfNelcoposts < ActiveRecord::Migration[5.0]
  def change
    change_column :nelcoposts, :image, :string
  end
end
