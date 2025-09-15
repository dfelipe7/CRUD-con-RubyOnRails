Rails.application.routes.draw do
  # resources :estudiantes genera automáticamente todas las rutas RESTful:
  # index (listar estudiantes), show (ver un estudiante), new (form nuevo),
  # create (guardar nuevo), edit (form editar), update (actualizar), destroy (eliminar).
  resources :estudiantes

  # Lo mismo para los cursos: crea todas las rutas RESTful (index, show, new, create, edit, update, destroy).
  resources :cursos

  # Para las matrículas restringimos las rutas: solo se crean estas acciones.
  # index   -> GET /matriculas (lista todas las matrículas)
  # new     -> GET /matriculas/new (formulario para nueva matrícula)
  # create  -> POST /matriculas (guardar nueva matrícula)
  # destroy -> DELETE /matriculas/:id (eliminar matrícula)
  # edit    -> GET /matriculas/:id/edit (formulario de edición)
  # update  -> PATCH/PUT /matriculas/:id (actualizar matrícula existente)
  # Notar que aquí NO se permite "show", porque no nos interesa mostrar matrícula individual.
  resources :matriculas, only: [:index, :new, :create, :destroy, :edit, :update]

  # Define la página de inicio de la aplicación (raíz del sitio).
  # root siempre apunta a un controlador y acción.
  # En este caso: controlador "home", acción "index".
  root "home#index"
end
