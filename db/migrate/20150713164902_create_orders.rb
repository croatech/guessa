class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :title
      t.text :desc
      t.string :status, default: "open"

      t.timestamps null: false
    end
  end
end
