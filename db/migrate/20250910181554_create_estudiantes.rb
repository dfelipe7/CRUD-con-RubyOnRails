class CreateEstudiantes < ActiveRecord::Migration[7.1]
  def change
    create_table :estudiantes do |t|
      t.string :nombre
      t.string :email
      t.integer :edad

      t.timestamps
    end
  end
end
