class AddNameToSpaces < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :name, :string
  end
end
