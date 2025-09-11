#Comando para crear el modelo y el archivo de migracion:
#rails generate model Estudiante nombre:string edad:integer email:string

# db:migrate - Crea la tabla  en la base de datos
#Comando para crear el controlador y la vista:
#rails generate controller Estudiantes

#Comando para crear el crud mas rapido:
#rails generate scaffold Estudiante nombre:string edad:integer email:string




class Estudiante < ApplicationRecord
  has_many :matriculas, dependent: :destroy
  has_many :cursos, through: :matriculas
end