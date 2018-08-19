class CreateNelcoposts < ActiveRecord::Migration[5.0]
  def change
    create_table :nelcoposts do |t|
      t.references :user, foreign_key: true
      t.binary :image
      t.string :title

      t.timestamps
    end
  end
end
