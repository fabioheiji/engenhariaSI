class CreateJoinTableMatchesUsers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :users

    create_join_table :matches, :users do |t|
    end
  end
end
