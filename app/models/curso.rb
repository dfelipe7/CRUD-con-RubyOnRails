class Curso < ApplicationRecord
  # Un curso también puede tener muchas matrículas.
  # Si se elimina el curso, se borran sus matrículas asociadas.
  has_many :matriculas, dependent: :destroy

  # Relación "muchos a muchos": un curso puede tener muchos estudiantes
  # y la conexión se hace a través de 'matriculas'.
  has_many :estudiantes, through: :matriculas
end
