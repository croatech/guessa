class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :user_name
      t.integer :score, default: 0
      t.integer :time
    end
  end
end