class Gossip < ApplicationRecord
  belongs_to :user
  has_many :join_table_tag_gossips
  has_many :tags, through: :join_table_tag_gossips
  validates :title, presence: true, length: { in: 3..14 }
  validates :content, presence: true
  has_many :comments
  has_many :likes, dependent: :destroy
end
