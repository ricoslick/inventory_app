class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :department
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :customers, [:user_id, :created_at]
  end
end
