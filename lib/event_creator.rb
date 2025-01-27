require_relative "event"

class EventCreator
  def self.run
    puts "Salut, tu veux créer un événement ? Cool !"

    # Nom de l'événement
    puts "Quel est le nom de l'événement ?"
    title = gets.chomp

    # Date de début
    puts "Quand aura-t-il lieu ? (Format : AAAA-MM-JJ HH:MM)"
    start_date = gets.chomp

    # Durée
    puts "Combien de temps va-t-il durer (en minutes) ?"
    duration = gets.chomp.to_i

    # Participants
    puts "Qui va participer ? (sépare les e-mails par des points-virgules)"
    attendees = gets.chomp.split(";").map(&:strip)

    # Création de l'événement
    event = Event.new(start_date, duration, title, attendees)

    # Affichage du résumé
    puts "Super, c'est noté, ton évènement a été créé !"
    event.to_s
  end
end
