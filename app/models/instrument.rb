class Instrument < ActiveHash::Base


  self.data = [
      {id: 1, name: 'Flute,Piccolo'}, {id: 2, name: 'Oboe'}, {id: 3, name: 'Clarinet'},
      {id: 4, name: 'Fagot'}, {id: 5, name: 'Saxophone'}, {id: 6, name: 'Trumpet'},
      {id: 7, name: 'Horn'}, {id: 8, name: 'Trombone'}, {id: 9, name: 'Euphonium'},
      {id: 10, name: 'Tuba'}, {id: 11, name: 'その他'}
  ]

include ActiveHash::Associations
has_many :reviews
end
