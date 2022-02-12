require 'rufus-scheduler'
require_relative "turnos"

scheduler = Rufus::Scheduler.new

cuenta = 0
cuenta_tiempo = 0

scheduler.every '10s' do
    puts 'Ejecutando script por vez numero: ' + cuenta.to_s
    check()
    cuenta = cuenta + 1
    cuenta_tiempo = cuenta_tiempo + 10
end

scheduler.join
