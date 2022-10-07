class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :private_quort
      t.string :limit
      t.string :half_quort
      t.string :level
      t.string :timestamps

      t.timestamps
    end
  end
end
