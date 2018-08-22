class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
    	t.string :category
      	t.references :user, foreign_key: true
      	t.string :make
      	t.string :model
      	t.string :serial

      	t.timestamps
    end
  end
end
