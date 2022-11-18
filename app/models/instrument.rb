class Instrument < ActiveHash::Base


  self.data = [
      {id: 1, name: 'Fl,Picc'}, {id: 2, name: 'Oboe'}, {id: 3, name: 'Cl'},
      {id: 4, name: 'Fg'}, {id: 5, name: 'Sax'}, {id: 6, name: 'Tp'},
      {id: 7, name: 'Hr'}, {id: 8, name: 'Tb'}, {id: 9, name: 'Euph'},
      {id: 10, name: 'Tuba'}, {id: 11, name: 'その他'}
  ]

include ActiveHash::Associations
has_many :reviews
end
