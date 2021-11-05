class CreateJoinTableUsersProducts < ActiveRecord::Migration
  def change
    create_join_table :users, :products do |t|
      t.index [:user_id, :product_id]
      t.index [:product_id, :user_id]
    end
  end
end
