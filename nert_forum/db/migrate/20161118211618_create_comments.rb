class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :text_body
      t.belongs_to :user, foreign_key: true
      t.belongs_to :post, foreign_key: true
      t.belongs_to :event, foreign_key: true

      t.timestamps
    end
  end
end
