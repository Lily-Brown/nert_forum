class AddAttachmentPhotoToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :photo
    end
    change_table :events do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :users, :photo
    remove_attachment :events, :photo
  end
end
