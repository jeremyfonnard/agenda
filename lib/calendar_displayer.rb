require "date"

class CalendarDisplayer
  def self.display(events, year, month)
    puts "Calendrier de #{Date::MONTHNAMES[month]} #{year}".center(70)
    puts "-" * 70
    puts "| " + %w[Lundi Mardi Mercredi Jeudi Vendredi Samedi Dimanche].join(" | ") + " |"
    puts "-" * 70

    # Calculer les jours du mois
    first_day = Date.new(year, month, 1)
    last_day = Date.new(year, month, -1)
    days = (first_day..last_day).to_a

    # Ajouter des espaces pour aligner avec le jour de la semaine
    print " " * (first_day.cwday - 1) * 10
    days.each do |day|
      # Afficher les événements du jour
      event = events.find { |e| e.start_date.to_date == day }
      cell = event ? "#{day.day}: #{event.title}" : day.day.to_s

      print cell.ljust(10)
      print "\n" if day.saturday?
    end
    puts
    puts "-" * 70
  end
end

