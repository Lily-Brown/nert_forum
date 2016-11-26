class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :text_body
      t.belongs_to :user, foreign_key: true
      t.integer :parent_id
      t.string  :parent_type

      t.timestamps
    end

    add_index :comments, [:parent_type, :parent_id]
  end
end
