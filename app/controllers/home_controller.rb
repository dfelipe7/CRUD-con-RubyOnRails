# Controlador principal para la página de inicio (Home)
# Aquí centralizamos estadísticas generales de la aplicación.
class HomeController < ApplicationController
  
  # Acción index → se ejecuta cuando entramos a la ruta raíz (root "/").
  def index
    # Cuenta cuántos estudiantes hay en la tabla "estudiantes".
    # ActiveRecord hace un SELECT COUNT(*) FROM estudiantes.
    @total_estudiantes = Estudiante.count

    # Cuenta cuántos cursos hay en la tabla "cursos".
    @total_cursos = Curso.count

    # Cuenta cuántas matrículas existen en la tabla "matriculas".
    @total_matriculas = Matricula.count
  end
end
