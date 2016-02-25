require 'test_helper'

describe MongoidSortedRelations do
  let(:b_document_1) { BDocument.new }
  let(:b_document_2) { BDocument.new }
  let(:b_document_3) { BDocument.new }

  let(:a_document) { ADocument.new }

  before do
    a_document.save!
    b_document_1.save!; b_document_2.save!; b_document_3.save!

    a_document.b_document_ids = [b_document_2.id, b_document_3.id, b_document_1.id]
    a_document.save
    
    a_document.reload
  end

  it 'preserves the give order' do
    a_document.b_documents.must_equal [b_document_2, b_document_3, b_document_1]
  end
end
