class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :email
      t.date :birth_date
      t.string :position, null: true

      t.timestamps
    end
  end
end
