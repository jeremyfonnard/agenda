require "time"

class Event
  attr_accessor :start_date, :duration, :title, :attendees

  # Initialisation événement
  def initialize(start_date, duration, title, attendees)
    @start_date = Time.parse(start_date)
    @duration = duration
    @title = title
    @attendees = attendees
  end

  # Décale de 24 heures
  def postpone_24h
    @start_date += 24 * 60 * 60 
  end

  # fin de l'événement
  def end_date
    @start_date + (@duration * 60) # Ajoute la durée en secondes
  end

  # Vérification 
  def is_past?
    Time.now > @start_date
  end

  # Vérification futur
  def is_future?
    !is_past?
  end

  # Vérifie si  moins de 30 minutes
  def is_soon?
    Time.now >= @start_date - (30 * 60) && Time.now < @start_date
  end

  # présentation

  def to_s
    puts "Titre : #{@title}"
    puts "Date de début : #{@start_date}"
    puts "Durée : #{@duration} minutes"
    puts "Invités : #{@attendees.join(', ')}"
  end
end
