class AddPrivateMatchToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :privateMatch, :boolean
  end
end
