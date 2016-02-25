class ADocument
  include Mongoid::Document

  has_and_belongs_to_many :b_documents
end
