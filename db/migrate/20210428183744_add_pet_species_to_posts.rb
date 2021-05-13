class AddPetSpeciesToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :species, :string
  end
end
