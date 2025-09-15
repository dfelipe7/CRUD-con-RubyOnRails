#Comando para crear el modelo y el archivo de migracion:
#rails generate model Estudiante nombre:string edad:integer email:string

# db:migrate - Crea la tabla  en la base de datos
#Comando para crear el controlador y la vista:
#rails generate controller Estudiantes

#Comando para crear el crud mas rapido:
#rails generate scaffold Estudiante nombre:string edad:integer email:string

class Estudiante < ApplicationRecord
  # Un estudiante puede tener muchas matrículas.
  # 'dependent: :destroy' significa que si un estudiante se elimina,
  # automáticamente se eliminan todas sus matrículas asociadas.
  has_many :matriculas, dependent: :destroy

  # Relación "muchos a muchos": un estudiante puede estar en muchos cursos
  # y accede a ellos a través de la tabla intermedia 'matriculas'.
  has_many :cursos, through: :matriculas
end
