require 'rails_helper'

RSpec.describe RecommendedBook, type: :model do
  subject do
    RecommendedBook.new(book_url: 'http://www.xxx.com', total_count: 3)
  end

  it { expect(subject.book_url).to eq('http://www.xxx.com') }
  it { expect(subject.total_count).to eq(3) }
end