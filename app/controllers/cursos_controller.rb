class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]

  # GET /cursos
  def index
    @cursos = Curso.all
  end

  # GET /cursos/1
  def show
  end

  # GET /cursos/new
  def new
    @curso = Curso.new
  end

  # POST /cursos
  def create
    @curso = Curso.new(curso_params)
    if @curso.save
      redirect_to cursos_path, notice: "Curso creado correctamente"
    else
      render :new
    end
  end

  # GET /cursos/1/edit
  def edit
  end

  # PATCH/PUT /cursos/1
  def update
    if @curso.update(curso_params)
      redirect_to cursos_path, notice: "Curso actualizado correctamente"
    else
      render :edit
    end
  end

  # DELETE /cursos/1
  def destroy
    @curso.destroy
    redirect_to cursos_path, notice: "Curso eliminado correctamente"
  end

  private

  def set_curso
    @curso = Curso.find(params[:id])
  end

  def curso_params
    params.require(:curso).permit(:nombre, :codigo, :creditos)
  end
end
