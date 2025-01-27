require "dotenv/load"
require_relative "lib/user"
require_relative "lib/event"
require_relative "lib/event_creator"
require_relative "lib/calendar_displayer"

# Création d'utilisateurs
julie = User.new("julie@julie.com", 35)
jean = User.new("jean@jean.com", 23)
claude = User.new("claude@claude.com", 75)

puts "Tous les utilisateurs : #{User.all.map(&:email)}"

# Recherche d'utilisateur
user_1 = User.find_by_email("claude@claude.com")
puts "Voici l'âge de #{user_1.email} : #{user_1.age}" if user_1

# Création d'un événement
event = Event.new("2025-01-28 09:00", 60, "Réunion importante", ["julie@julie.com", "jean@jean.com"])
event.to_s

# Décaler l'événement de 24 heures
event.postpone_24h
puts "Événement décalé de 24 heures :"
event.to_s

# Vérifier si l'événement est passé ou bientôt
puts "L'événement est-il passé ? #{event.is_past?}"
puts "L'événement est-il dans moins de 30 minutes ? #{event.is_soon?}"


EventCreator.run

events = [
  Event.new("2025-01-08 10:00", 60, "Réunion A", []),
  Event.new("2025-01-15 15:00", 30, "Réunion B", []),
  Event.new("2025-01-22 18:00", 120, "Conférence", [])
]

# Affiche le calendrier pour janvier 2025
CalendarDisplayer.display(events, 2025, 1)
