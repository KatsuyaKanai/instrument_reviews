class Title < ActiveHash::Base
  self.data = [
    { id: 1, name: '楽器修理、調整' }, { id: 2, name: '楽器購入' }, { id: 3, name: '消耗品購入' },
    { id: 4, name: '楽器売却' }, { id: 5, name: '楽譜、アクセサリー購入' }, { id: 6, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :reviews
end
