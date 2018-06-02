class AddStateToInscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :inscriptions, :state, :string
  end
end
