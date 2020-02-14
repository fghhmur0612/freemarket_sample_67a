class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  belongs_to :category, optional: true #nullを許可

  # fields_forメソッドを利用する際に、親モデルの中に書く必要があるメソッド。引数として子モデルの名前を書く。
  # allow_destroy: trueで親のレコードが削除された場合に、関連付いている子のレコードも一緒に削除してくれます
  accepts_nested_attributes_for :images, allow_destroy: true

  
  validates :name,      length: { maximum: 40 }
  validates :explain,   length: { maximum: 1000 }
  validates :price,     numericality: { only_integr: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }




  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_way
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :item_condition

end