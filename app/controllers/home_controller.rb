class HomeController < ApplicationController
  def index
    @total_estudiantes = Estudiante.count
    @total_cursos = Curso.count
    @total_matriculas = Matricula.count
  end
end
