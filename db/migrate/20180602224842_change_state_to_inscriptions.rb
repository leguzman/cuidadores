class ChangeStateToInscriptions < ActiveRecord::Migration[5.2]
  def change
    change_column :inscriptions, :state, :string ,default: "En Revisión"
  end
end
