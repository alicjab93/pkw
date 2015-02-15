# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Reason.find_or_create_by(label: 'Wielokrotny wybór')
Reason.find_or_create_by(label: 'Brak wyboru')

# województwa
@province = Province.find_or_create_by(id: 1, name: 'dolnośląskie')
@province = Province.find_or_create_by(id: 2, name: 'kujawsko-pomorskie')
@province = Province.find_or_create_by(id: 3, name: 'lubelskie')
@province = Province.find_or_create_by(id: 4, name: 'lubuskie')
@province = Province.find_or_create_by(id: 5, name: 'łódzkie')
@province = Province.find_or_create_by(id: 6, name: 'małopolskie')
@province = Province.find_or_create_by(id: 7, name: 'mazowieckie')
@province = Province.find_or_create_by(id: 8, name: 'opolskie')
@province = Province.find_or_create_by(id: 9, name: 'podkarpackie')
@province = Province.find_or_create_by(id: 10, name: 'podlaskie')
@province = Province.find_or_create_by(id: 11, name: 'pomorskie')
@province = Province.find_or_create_by(id: 12, name: 'śląskie')
@province = Province.find_or_create_by(id: 13, name: 'świętokrzyskie')
@province = Province.find_or_create_by(id: 14, name: 'warmińsko-mazurskie')
@province = Province.find_or_create_by(id: 15, name: 'wielkopolskie')
@province = Province.find_or_create_by(id: 16, name: 'zachodniopomorskie')

# okręgi wyborcze
require 'csv'    
csv_text = File.read(Rails.root.join('db', 'seeds', 'constituency.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  #Constituency.find_or_create_by(number: 1, voters:503466, ballots: 165870, mandates: 8, province_id: @province.id)
  Constituency.find_or_create_by(row.to_hash)
end

# komitety
Committee.find_or_create_by(id: 1, name: 'Polskie Stronnictwo Ludowe')
Committee.find_or_create_by(id: 2, name: 'Demokracja Bezpośrednia')
Committee.find_or_create_by(id: 3, name: 'Prawo i Sprawiedliwość')
Committee.find_or_create_by(id: 4, name: 'Platforma Obywatelska')
Committee.find_or_create_by(id: 5, name: 'Ruch Narodowy')
Committee.find_or_create_by(id: 6, name: 'SLD Lewica Razem')
Committee.find_or_create_by(id: 7, name: 'Nowa Prawica')
Committee.find_or_create_by(id: 8, name: 'Bezpartyjni Samorządowcy')

# przypisanie komitetów do województw
@provinces = Province.all
committees = Committee.all

@provinces.each do |province|
  if(province.committees.count == 0)
    puts 'przypisuję losowe komitety do województwa'
    province.committees << committees.shuffle[0..3]
  end
end

# glosy
Constituency.all.each do |constituency|
  iv = InvalidVote.find_or_create_by(constituency_id: constituency.id, reason_id: 1)
  iv.update_attribute(:quantity, 1 + Random.rand(20))
  iv = InvalidVote.find_or_create_by(constituency_id: constituency.id, reason_id: 2)
  iv.update_attribute(:quantity, 1 + Random.rand(20))
  constituency.committees.each do |committee|
    v = ValidVote.find_or_create_by(constituency_id: constituency.id, committee_id: committee.id)
    v.update_attribute(:quantity, Random.rand(1500))
  end
end