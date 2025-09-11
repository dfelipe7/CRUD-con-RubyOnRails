# Este controlador maneja la gestión de estudiantes y está configurado para funcionar
# tanto con las vistas tradicionales de Rails (archivos .erb) como con un frontend en React
# que consume la API en formato JSON. 
# Para permitir esto, se ajustó la protección CSRF y CORS de manera que:
# - Cuando se accede desde las vistas .erb, Rails sigue usando sus helpers de seguridad y redirecciones.
# - Cuando se accede desde React, se exponen los endpoints como API REST que devuelven y aceptan JSON.
# De esta forma, la aplicación combina ambos enfoques sin perder compatibilidad.

class EstudiantesController < ApplicationController
  before_action :set_estudiante, only: [:show, :edit, :update, :destroy]

  # GET /estudiantes
  def index
    @estudiantes = Estudiante.all

    respond_to do |format|
      format.html # renderiza index.html.erb
      format.json { render json: @estudiantes }
    end
  end

  # GET /estudiantes/:id
  def show
    respond_to do |format|
      format.html # renderiza show.html.erb
      format.json { render json: @estudiante }
    end
  end

  # GET /estudiantes/new
  def new
    @estudiante = Estudiante.new
  end

  # POST /estudiantes
  def create
    @estudiante = Estudiante.new(estudiante_params)

    respond_to do |format|
      if @estudiante.save
        format.html { redirect_to estudiantes_path, notice: "Estudiante creado correctamente" }
        format.json { render json: @estudiante, status: :created }
      else
        format.html { render :new }
        format.json { render json: @estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /estudiantes/:id/edit
  def edit
  end

  # PATCH/PUT /estudiantes/:id
  def update
    respond_to do |format|
      if @estudiante.update(estudiante_params)
        format.html { redirect_to estudiantes_path, notice: "Estudiante actualizado con éxito" }
        format.json { render json: @estudiante }
      else
        format.html { render :edit }
        format.json { render json: @estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estudiantes/:id
  def destroy
    @estudiante.destroy

    respond_to do |format|
      format.html { redirect_to estudiantes_path, notice: "Estudiante eliminado" }
      format.json { head :no_content }
    end
  end

  private

  def set_estudiante
    @estudiante = Estudiante.find(params[:id])
  end

  def estudiante_params
    params.require(:estudiante).permit(:nombre, :edad, :email)
  end
end
