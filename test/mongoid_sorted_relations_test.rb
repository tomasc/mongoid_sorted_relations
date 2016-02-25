require 'test_helper'

describe MongoidSortedRelations do
  let(:b_document_1) { BDocument.new }
  let(:b_document_2) { BDocument.new }
  let(:b_document_3) { BDocument.new }

  let(:a_document) { ADocument.create }

  before do
    a_document.b_documents << b_document_1
    a_document.b_documents << b_document_2
    a_document.b_documents << b_document_3
  end

  it 'preserves the give order' do
    a_document.b_documents.must_equal [b_document_1, b_document_2, b_document_3]
  end
end
