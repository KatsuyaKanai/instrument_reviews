class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'このサイトに関するお問い合わせ' },
    { id: 2, name: '楽器店の新規登録' },
    { id: 3, name: 'その他ご要望' },
  ]
end
