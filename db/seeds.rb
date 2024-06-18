User.destroy_all
Actividad.destroy_all
Solicitud.destroy_all
Resena.destroy_all
Room.destroy_all
Message.destroy_all

User.find_or_create_by!(email: 'admin@oficial.com') do |user|
  user.name = 'Admin User'
    user.phone = '1234567890'
    user.descripcion = 'Administrator of the system'
    user.password = 'securepassword'  # Ensure you use a strong password
    user.password_confirmation = 'securepassword'  # Match the password
    user.admin = true
end

User.find_or_create_by!(email: 'ffontecilla@uc.cl') do |user|
  user.name = 'francisco admin'
    user.phone = '1234567890'
    user.descripcion = 'Administrator of the system'
    user.password = '123456'  # Ensure you use a strong password
    user.password_confirmation = '123456'  # Match the password
    user.admin = true
end


User.find_or_create_by!(email: 'cinfantm@uc.cl') do |user|
  user.name = 'cata no admin'
    user.phone = '1234567890'
    user.descripcion = 'Administrator of the system'
    user.password = '123456'  # Ensure you use a strong password
    user.password_confirmation = '123456'  # Match the password
    user.admin = false
end

User.find_or_create_by!(email: 'camila.becerra@uc.cl') do |user|
  user.name = 'cami admin'
    user.phone = '1234567890'
    user.descripcion = 'Administrator of the system'
    user.password = '123456'  # Ensure you use a strong password
    user.password_confirmation = '123456'  # Match the password
    user.admin = true
end

# Array of Spanish names
SPANISH_NAMES = [
  "Sofía", "Valentina", "Isabella", "Camila", "Valeria", "Victoria", "Lucía", "Martina", "María", "Paula",
  "Sara", "Julia", "Emma", "Daniela", "Emily", "Mariana", "Ximena", "Regina", "Fernanda", "Gabriela",
  "Mateo", "Santiago", "Matías", "Benjamín", "Alejandro", "Diego", "Samuel", "Nicolás", "Lucas", "Daniel",
  "Sebastián", "Ángel", "Leonardo", "Eduardo", "Joaquín", "Adrián", "Emiliano", "Carlos", "Ian", "Juan"
]

# Array of Spanish sports names
SPANISH_SPORTS = [
  "fútbol", "baloncesto", "tenis", "natación", "atletismo", "ciclismo", "voleibol", "béisbol", "golf", "rugby",
  "esquí", "surf", "escalada", "kayak", "patinaje", "boxeo", "hockey", "pádel", "automovilismo", "motociclismo", 
  "leer libros","caminar","nadar","correr","hacer yoga","cocinar","dibujar","tocar piano","jugar videojuegos",
  "ver películas","jardinería","andar bicicleta","escribir diario","meditar","fotografía","manualidades",
  "aprender idiomas","escuchar música","asistir talleres","ejercicio","viajar","pescar","senderismo","visitar museos",
  "jugar ajedrez","hacer puzzles","comer fuera","compras","deportes equipo","visitar amigos"
]

ADJETIVO = [
  "loco", "divertido", "asombroso", "distinto", "tranquilo", "para principiantes", "avanzado", "premium", "profesional", "lento"
]

RESENA_ADJ = [
    "Agradable",
    "Divertida",
    "Interesante",
    "Emocionante",
    "Educativa",
    "Relajante",
    "Fascinante",
    "Estimulante",
    "Inspiradora",
    "Enriquecedora",
    "Aburrida",
    "Monótona",
    "Estresante",
    "Complicada",
    "Confusa",
    "Desafiante",
    "Frustrante",
    "Larga",
    "Agotadora",
    "Repetitiva"
]

VALOROP = [0, 5000, 10000, 15000, 20000]

# Seed 50 Users with random Spanish names, sports in descriptions, and secure passwords
users = []
SPANISH_NAMES.each_with_index do |name, i|
  name = name
  sport = SPANISH_SPORTS.sample
  email = "#{name.parameterize(separator: '')}@uc.cl"  # Example of generating email from name
  password = '123456'

  users << User.find_or_create_by!(email: email) do |user|
    user.name = name
    user.phone = "934#{i % 10}6236#{i % 10}"
    user.descripcion = "Me gusta mucho #{sport}"
    user.password = password
    user.password_confirmation = password
    user.admin = false
  end
end

# Create 6 Activities for Each User
users.each do |user|
  10.times do |i|
    @titulo = "#{SPANISH_SPORTS.sample} #{ADJETIVO.sample}"
    @actividad_actual = Actividad.find_or_create_by!(titulo: @titulo) do |actividad|
      actividad.user_id = user.id
      actividad.descripcion = "Se trata de un deporte #{ADJETIVO.sample}"
      actividad.fecha = DateTime.now + rand(1..30).days
      actividad.valor = VALOROP.sample
      actividad.publica = [true, false].sample
    end
    Room.find_or_create_by!(name: "#{@actividad_actual.id} #{@actividad_actual.titulo}") do |room|
      room.actividad_id = Actividad.last.id
    end
  end
end


# Create 10 Solicitudes for Different Activities
users.each do |user|
  solicitado = []
  actividades = Actividad.where.not(user_id: user.id)
  actividades = actividades.shuffle
  count = 0
  actividades.each do |actividad|
    next if solicitado.include?(actividad.id)
        Solicitud.find_or_create_by!(descripcion: "Solicitud #{count} para Actividad #{actividad.id} de #{user.name}") do |solicitud|
          solicitud.user_id = user.id
          solicitud.actividad_id = actividad.id
          solicitud.estado = actividad.publica
        break if count >= 10  # Exit loop after 10 iterations
        count += 1
        solicitado << actividad.id
    end
  end
end

solicitudes = Solicitud.where(estado: true)
solicitudes.each do |solicitud|
  Resena.find_or_create_by!(contenido: "La actividad me parecio #{RESENA_ADJ.sample}") do |resena|
    resena.user_id = solicitud.user_id
    resena.actividad_id = solicitud.actividad_id
    resena.fecha = DateTime.now + rand(1..10).days
    resena.calificacion = rand(1..5)
  end
end

    @titulo = "Club lectura"
    @actividad_actual = Actividad.find_or_create_by!(titulo: @titulo) do |actividad|
      actividad.user_id = User.find_by(email: 'cinfantm@uc.cl').id
      actividad.descripcion = "Grupo de personas que se reúnen regularmente para discutir libros previamente seleccionados"
      actividad.fecha = DateTime.now + rand(1..30).days
      actividad.valor = 15000
      actividad.publica = false
    end
    Room.find_or_create_by!(name: "#{@actividad_actual.id} #{@actividad_actual.titulo}") do |room|
      room.actividad_id = Actividad.last.id
    end

    @titulo = "Camping en parques nacionales"
    @actividad_actual = Actividad.find_or_create_by!(titulo: @titulo) do |actividad|
      actividad.user_id = User.find_by(email: 'cinfantm@uc.cl').id
      actividad.descripcion = "Unete a excursiones con amigos y familiares para disfrutar de la naturaleza"
      actividad.fecha = DateTime.now + rand(1..30).days
      actividad.valor = 10000
      actividad.publica = false
    end
    Room.find_or_create_by!(name: "#{@actividad_actual.id} #{@actividad_actual.titulo}") do |room|
      room.actividad_id = Actividad.last.id
    end

    @titulo = "Voluntariado"
    @actividad_actual = Actividad.find_or_create_by!(titulo: @titulo) do |actividad|
      actividad.user_id = User.find_by(email: 'cinfantm@uc.cl').id
      actividad.descripcion = "Ayuda a los demás y a la comunidad, participando en actividades de voluntariado"
      actividad.fecha = DateTime.now + rand(1..30).days
      actividad.valor = 0
      actividad.publica = true
    end
    Room.find_or_create_by!(name: "#{@actividad_actual.id} #{@actividad_actual.titulo}") do |room|
      room.actividad_id = Actividad.last.id
    end

    @titulo = "Clases de cocina"
    @actividad_actual = Actividad.find_or_create_by!(titulo: @titulo) do |actividad|
      actividad.user_id = User.find_by(email: 'ffontecilla@uc.cl').id
      actividad.descripcion = "Aprende a cocinar platos deliciosos y sorprende a tus amigos y familiares"
      actividad.fecha = DateTime.now + rand(1..30).days
      actividad.valor = 20000
      actividad.publica = false
    end
    Room.find_or_create_by!(name: "#{@actividad_actual.id} #{@actividad_actual.titulo}") do |room|
      room.actividad_id = Actividad.last.id
    end

    @titulo = "Grupo estudio Software Engineering"
    @actividad_actual = Actividad.find_or_create_by!(titulo: @titulo) do |actividad|
      actividad.user_id = User.find_by(email: 'ffontecilla@uc.cl').id
      actividad.descripcion = "Vuelvete un genio en ruby on rails"
      actividad.fecha = DateTime.now + rand(1..30).days
      actividad.valor = 10000
      actividad.publica = false
    end
    Room.find_or_create_by!(name: "#{@actividad_actual.id} #{@actividad_actual.titulo}") do |room|
      room.actividad_id = Actividad.last.id
    end

    @titulo = "Jardineria en casa"
    @actividad_actual = Actividad.find_or_create_by!(titulo: @titulo) do |actividad|
      actividad.user_id = User.find_by(email: 'ffontecilla@uc.cl').id
      actividad.descripcion = "Aprende a cuidar tus plantas y flores en casa"
      actividad.fecha = DateTime.now + rand(1..30).days
      actividad.valor = 10000
      actividad.publica = false
    end
    Room.find_or_create_by!(name: "#{@actividad_actual.id} #{@actividad_actual.titulo}") do |room|
      room.actividad_id = Actividad.last.id
    end