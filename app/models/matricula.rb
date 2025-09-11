class Matricula < ApplicationRecord
  belongs_to :estudiante
  belongs_to :curso
end
