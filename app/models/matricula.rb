class Matricula < ApplicationRecord
  # Cada matrícula pertenece a un único estudiante.
  belongs_to :estudiante

  # Cada matrícula pertenece a un único curso.
  belongs_to :curso
end
