require "uri"
require "net/http"
require 'json'

def check

    url_febrero = URI("https://app.bookitit.com/onlinebookings/datetime/?callback=jQuery21105625983407467618_1644453221902&type=default&publickey=231ee9870d4e4cf35fe3e94537131ef65&lang=es&services%5B%5D=bkt302060&agendas%5B%5D=bkt142494&version=12&src=https%3A%2F%2Fapp.bookitit.com%2Fes%2Fhosteds%2Fwidgetdefault%2F231ee9870d4e4cf35fe3e94537131ef65&srvsrc=https%3A%2F%2Fapp.bookitit.com&start=2022-02-01&end=2022-02-28&selectedPeople=1&_=1644453221916")
    #url_febrero = URI("https://app.bookitit.com/onlinebookings/datetime/?callback=jQuery211016170078297055124_1644671209227&type=default&publickey=231ee9870d4e4cf35fe3e94537131ef65&lang=es&services%5B%5D=bkt302071&agendas%5B%5D=bkt142505&version=12&src=https%3A%2F%2Fapp.bookitit.com%2Fes%2Fhosteds%2Fwidgetdefault%2F231ee9870d4e4cf35fe3e94537131ef65&srvsrc=https%3A%2F%2Fapp.bookitit.com&start=2022-04-01&end=2022-04-30&selectedPeople=1&_=1644671209233")
    url_marzo = URI("https://app.bookitit.com/onlinebookings/datetime/?callback=jQuery21105625983407467618_1644453221902&type=default&publickey=231ee9870d4e4cf35fe3e94537131ef65&lang=es&services%5B%5D=bkt302060&agendas%5B%5D=bkt142494&version=12&src=https%3A%2F%2Fapp.bookitit.com%2Fes%2Fhosteds%2Fwidgetdefault%2F231ee9870d4e4cf35fe3e94537131ef65&srvsrc=https%3A%2F%2Fapp.bookitit.com&start=2022-03-01&end=2022-03-31&selectedPeople=1&_=1644453221917")

    https = Net::HTTP.new(url_febrero.host, url_febrero.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url_febrero)

    response_febrero = https.request(request)
    puts 'TURNOS FEBRERO'

    febrero = response_febrero.body.split('callback=jQuery21105625983407467618_1644453221902')
    #febrero = response_febrero.body.split('callback=jQuery211016170078297055124_1644671209227')

    miJson_febrero = JSON.parse(febrero[1].delete('();'))

    # puts miJson["Slots"]

    miJson_febrero["Slots"].each do |slot|
        #puts slot["date"]
        if !slot["times"].empty?
            puts 'hay lugar en' + slot["date"].to_s
        end
    end

    https = Net::HTTP.new(url_marzo.host, url_marzo.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url_marzo)

    response_marzo = https.request(request)

    marzo = response_marzo.body.split('callback=jQuery21105625983407467618_1644453221902')

    puts 'TURNOS MARZO'

    miJson_marzo = JSON.parse(marzo[1].delete('();'))

    miJson_marzo["Slots"].each do |slot|
        #puts slot["date"]
        if !slot["times"].empty?
            puts 'hay lugar en' + slot["date"].to_s
        end
    end

end

check()