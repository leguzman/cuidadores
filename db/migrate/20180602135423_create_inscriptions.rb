class CreateInscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :inscriptions do |t|
      t.date :date
      t.integer :course_id
      t.integer :user_id
      

      t.timestamps
    end
  end
end
