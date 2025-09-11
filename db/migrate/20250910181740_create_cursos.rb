class CreateCursos < ActiveRecord::Migration[7.1]
  def change
    create_table :cursos do |t|
      t.string :nombre
      t.string :codigo
      t.integer :creditos

      t.timestamps
    end
  end
end
