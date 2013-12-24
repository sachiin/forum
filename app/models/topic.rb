#module Mongoid
#   module Document
#    def as_json(options={})
#        attrs = super(options)
#        attrs["id"] = self.persisted? ? self._id : nil
#        attrs
#      end
#    end
# end
class Topic
  include Mongoid::Document
  field :name, type: String
  field :title, type: String
  field :content, type: String
  validates :name, presence: true
  validates :title, presence: true
  validates :content, presence: true
  embeds_many :comments
  accepts_nested_attributes_for :comments
end
