class Comment
  include Mongoid::Document
  field :name, type: String
  field :content, type: String
  embedded_in :topic, inverse_of: :comments
  validates :name , presence: true
  validates :content, presence: true
end
