class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.float :latitude
      t.float :longitude
      t.string :description
      t.string :image
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
