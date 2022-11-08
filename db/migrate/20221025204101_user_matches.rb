class UserMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :user_id, :integer
  end
end
