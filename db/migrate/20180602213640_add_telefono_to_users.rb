class AddTelefonoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nombres, :string
    add_column :users, :apellidos, :string
    add_column :users, :telefono, :string
    add_column :users, :direccion, :string
    
  end
end
