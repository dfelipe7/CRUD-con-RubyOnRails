# Fuente oficial desde donde Bundler descarga las gemas
source "https://rubygems.org"

# Rails es el framework principal del proyecto
gem "rails", "~> 8.0.2"

# Propshaft: maneja los assets (CSS, JS, imágenes) en lugar del viejo sprockets
gem "propshaft"

# Base de datos SQLite3 (local, sencilla para desarrollo y pruebas)
gem "sqlite3", "~> 1.6.9"

# Puma: el servidor web recomendado para producción en Rails
gem "puma", ">= 5.0"

# Importmap: permite usar JS sin necesidad de Node o Webpack (más simple)
gem "importmap-rails"

# Turbo: parte de Hotwire, hace que las páginas se actualicen sin recargar todo
gem "turbo-rails"

# Stimulus: mini framework JS para manejar interactividad desde Rails
gem "stimulus-rails"

# Jbuilder: genera JSON fácilmente, útil para APIs
gem "jbuilder"

# rack-cors: habilita CORS para que otros clientes (ej. React, móvil) puedan consumir la API
gem "rack-cors"

# gem "bcrypt", "~> 3.1.7"
# (comentada) se usa para encriptar contraseñas cuando implementas login con `has_secure_password`

# tzinfo-data: necesario en Windows porque no incluye info de zonas horarias
gem "tzinfo-data", platforms: %i[ windows jruby ]

# solid_cache, solid_queue, solid_cable → herramientas nuevas en Rails 7.1
# - solid_cache: cache basado en base de datos
# - solid_queue: cola de trabajos (background jobs)
# - solid_cable: ActionCable simplificado para websockets
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# bootsnap: acelera el arranque de Rails cachéando carga de gemas
gem "bootsnap", require: false

# kamal: despliegue en contenedores Docker
gem "kamal", require: false

# thruster: optimización de rendimiento para Puma (compresión, caching HTTP)
gem "thruster", require: false

# gem "image_processing", "~> 1.2"
# (comentada) se usa para manipular imágenes en ActiveStorage (redimensionar, filtros, etc.)

# Grupo de desarrollo y test → gemas que no van a producción
group :development, :test do
  # debug: depuración paso a paso en Ruby
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # brakeman: analiza el código en busca de vulnerabilidades de seguridad
  gem "brakeman", require: false

  # rubocop-rails-omakase: estilo de código recomendado por Rails
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # web-console: te abre una consola interactiva en el navegador cuando hay errores
  gem "web-console"
end

group :test do
  # capybara: framework para pruebas de integración (simula clicks, formularios, etc.)
  gem "capybara"
  # selenium-webdriver: usado por Capybara para abrir navegadores reales en pruebas
  gem "selenium-webdriver"
end
