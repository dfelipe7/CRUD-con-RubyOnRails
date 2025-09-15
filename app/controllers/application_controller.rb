class ApplicationController < ActionController::Base
  # Este es el controlador base de la aplicación.
  # Todos los controladores heredan de aquí, por lo tanto
  # cualquier configuración definida aquí se aplica globalmente.

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  #allow_browser versions: :modern
  # Esta línea está comentada.
  # Si estuviera activa, restringiría la app a navegadores modernos
  # que soporten ciertas características (WebP, import maps, etc.).

  # Habilita la protección contra ataques CSRF (Cross-Site Request Forgery).
  # CSRF es cuando un atacante intenta enviar peticiones a tu app
  # en nombre del usuario sin su consentimiento.
  protect_from_forgery with: :exception
  # "with: :exception" significa que, si se detecta un ataque CSRF,
  # Rails lanza una excepción y no ejecuta la acción.

  # Desactiva la verificación CSRF SOLO cuando la petición es JSON.
  # Esto se hace normalmente cuando el frontend no es Rails (por ejemplo, React).
  # En ese caso, no tiene sentido exigir el token CSRF porque la comunicación es tipo API.
  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }
end
