class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category, index: true
      t.integer :schemecode
      t.string :s_name
      t.integer :rating
      t.text :objective
      t.integer :clicks
      t.timestamps null: false
    end
  end
end
