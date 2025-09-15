# Este controlador maneja las operaciones CRUD (Crear, Leer, Actualizar, Eliminar)
# para la entidad Estudiante.
# Funciona tanto con vistas tradicionales de Rails (HTML/ERB) como con clientes externos (React, Postman, etc.)
# que consumen datos en formato JSON. 
# Por eso, en cada acción usamos `respond_to` para decidir qué devolver.

class EstudiantesController < ApplicationController
  # --- FILTROS ---
  # Este callback se ejecuta ANTES de ciertas acciones (:show, :edit, :update, :destroy).
  # Sirve para buscar un estudiante en la base de datos según el ID que llega en la URL.
  before_action :set_estudiante, only: [:show, :edit, :update, :destroy]

  # --- ACCIONES PRINCIPALES (CRUD) ---

  # GET /estudiantes
  # Acción para listar todos los estudiantes.
  # Si el navegador pide HTML, carga la vista index.html.erb
  # Si el cliente pide JSON, devuelve un array de estudiantes.
  def index
    @estudiantes = Estudiante.all

    respond_to do |format|
      format.html # renderiza automáticamente la vista index.html.erb
      format.json { render json: @estudiantes }
    end
  end

  # GET /estudiantes/:id
  # Acción para mostrar un estudiante específico.
  # Usa el @estudiante cargado en set_estudiante.
  def show
    respond_to do |format|
      format.html # renderiza show.html.erb
      format.json { render json: @estudiante }
    end
  end

  # GET /estudiantes/new
  # Acción que prepara un nuevo objeto vacío de estudiante.
  # Se usa en el formulario de creación (new.html.erb).
  def new
    @estudiante = Estudiante.new
  end

  # POST /estudiantes
  # Acción para CREAR un estudiante en la base de datos.
  def create
    @estudiante = Estudiante.new(estudiante_params) # se construye con los parámetros permitidos

    respond_to do |format|
      if @estudiante.save
        # Caso exitoso:
        # - HTML: redirige a la lista con un mensaje
        # - JSON: devuelve el objeto recién creado con código 201
        format.html { redirect_to estudiantes_path, notice: "Estudiante creado correctamente" }
        format.json { render json: @estudiante, status: :created }
      else
        # Caso fallido (ej: validaciones no pasan):
        # - HTML: vuelve a mostrar el formulario
        # - JSON: devuelve los errores con código 422
        format.html { render :new }
        format.json { render json: @estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /estudiantes/:id/edit
  # Acción para mostrar el formulario de edición.
  # No necesita lógica porque @estudiante ya se cargó en set_estudiante.
  def edit
  end

  # PATCH/PUT /estudiantes/:id
  # Acción para ACTUALIZAR un estudiante existente.
  def update
    respond_to do |format|
      if @estudiante.update(estudiante_params)
        # Si la actualización es exitosa:
        # - HTML: redirige a la lista con un mensaje
        # - JSON: devuelve el objeto actualizado
        format.html { redirect_to estudiantes_path, notice: "Estudiante actualizado con éxito" }
        format.json { render json: @estudiante }
      else
        # Si falla la actualización:
        # - HTML: vuelve al formulario de edición
        # - JSON: devuelve los errores con código 422
        format.html { render :edit }
        format.json { render json: @estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estudiantes/:id
  # Acción para ELIMINAR un estudiante de la base de datos.
  def destroy
    @estudiante.destroy

    respond_to do |format|
      # - HTML: redirige a la lista
      # - JSON: responde con "204 No Content" (respuesta vacía pero válida)
      format.html { redirect_to estudiantes_path, notice: "Estudiante eliminado" }
      format.json { head :no_content }
    end
  end

  # --- MÉTODOS PRIVADOS ---
  # Aquí van los helpers internos del controlador, no accesibles desde fuera.

  private

  # Busca un estudiante en la base de datos según el id de la URL.
  # Ejemplo: GET /estudiantes/3 → params[:id] = 3
  def set_estudiante
    @estudiante = Estudiante.find(params[:id])
  end

  # Strong Parameters: define qué atributos están permitidos
  # para evitar inyecciones o asignaciones indebidas.
  # Solo permite :nombre, :edad y :email.
  def estudiante_params
    params.require(:estudiante).permit(:nombre, :edad, :email)
  end
end
