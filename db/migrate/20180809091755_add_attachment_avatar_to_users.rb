class AddAttachmentAvatarToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :avatar
  end

  def down
    remove_column :users, :avatar
  end
end
