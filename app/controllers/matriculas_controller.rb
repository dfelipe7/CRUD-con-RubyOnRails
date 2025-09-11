class MatriculasController < ApplicationController
  def index
    @matriculas = Matricula.all
  end

  def new
    @matricula = Matricula.new
    @estudiantes = Estudiante.all
    @cursos = Curso.all
  end

  def create
    @matricula = Matricula.new(matricula_params)
    if @matricula.save
      redirect_to matriculas_path, notice: "Matrícula creada correctamente"
    else
      @estudiantes = Estudiante.all
      @cursos = Curso.all
      render :new
    end
  end

# GET /matriculas/:id/edit
def edit
  @matricula = Matricula.find(params[:id])
end

# PATCH/PUT /matriculas/:id
def update
  @matricula = Matricula.find(params[:id])
  if @matricula.update(matricula_params)
    redirect_to matriculas_path, notice: "Matrícula actualizada correctamente"
  else
    render :edit
  end
end


  def destroy
    @matricula = Matricula.find(params[:id])
    @matricula.destroy
    redirect_to matriculas_path, notice: "Matrícula eliminada"
  end

  private

  def matricula_params
    params.require(:matricula).permit(:estudiante_id, :curso_id)
  end
end
