class Curso < ApplicationRecord
  has_many :matriculas, dependent: :destroy
  has_many :estudiantes, through: :matriculas
end
