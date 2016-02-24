class AddAttachmentAvatarToSymptoms < ActiveRecord::Migration
  def self.up
    change_table :symptoms do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :symptoms, :avatar
  end
end
