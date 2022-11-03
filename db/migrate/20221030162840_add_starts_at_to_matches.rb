class AddStartsAtToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :starts_at, :datetime
  end
end
