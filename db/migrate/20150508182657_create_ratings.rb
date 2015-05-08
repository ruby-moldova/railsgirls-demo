class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.integer    :value
      t.timestamps null: false
    end
  end
end
