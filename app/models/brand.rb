class Brand < ActiveHash::Base
  self.data = [
      {id: 1, name: 'シャネル'}, {id: 2, name: 'ロエベ'}, {id: 3, name: 'ルイヴィトン'},
      {id: 4, name: 'エルメス'}, {id: 5, name: 'クロエ'}, {id: 6, name: 'ボッテガ・ヴェネタ'},
      {id: 7, name: 'セリーヌ'}, {id: 8, name: 'プラダ'}, {id: 9, name: 'グッチ'},
      {id: 10, name: 'ナイキ'}, {id: 11, name: 'アディダス'}, {id: 12, name: 'ノースフェイス'},
      {id: 13, name: 'プーマ'}, {id: 14, name: 'アシックス'}, {id: 15, name: 'ニューバランス'},
      {id: 16, name: 'マイヤー'}, {id: 17, name: 'フィスラ'}, {id: 18, name: 'ティファール'},
      {id: 19, name: 'ストウブ'}, {id: 20, name: 'ダイガー'}, {id: 21, name: 'バルミューダ'},
      {id: 22, name: 'シャープ'}, {id: 23, name: 'ソニー'}, {id: 24, name: '日立製作所'},
      {id: 25, name: 'デロンギ'}, {id: 26, name: 'ＮＥＣ'}, {id: 27, name: 'パナソニック'},
      {id: 28, name: '東芝'}, {id: 29, name: 'その他のブランド'}, {id: 30, name: 'ノーブランド'},
  ]
  include ActiveHash::Associations
  has_many :items
end