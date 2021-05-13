class AddNotNullableToPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :petname, false
    change_column_null :posts, :age, false
    change_column_null :posts, :description, false
    change_column_null :posts, :species, false
  end
end
