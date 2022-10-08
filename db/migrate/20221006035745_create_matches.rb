class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :name
      t.string :description
      t.string :address
      t.boolean :privateCourt
      t.string :limit
      t.boolean :halfCourt
      t.string :level
      t.timestamps
    end
  end
end
