class AddPrivateMatchPasswordToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :privateMatchPassword, :string
  end
end
