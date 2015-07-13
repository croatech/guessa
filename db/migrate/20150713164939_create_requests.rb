class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :order_id
      t.integer :user_id
      t.string :status

      t.timestamps null: false
    end
  end
end
