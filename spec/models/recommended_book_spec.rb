require 'rails_helper'

RSpec.describe RecommendedBook, type: :model do
  subject do
    RecommendedBook.new(url: 'http://www.xxx.com', total_count: 3, aggregation_date: Date.parse('2021-01-23'))
  end

  it { expect(subject.url).to eq('http://www.xxx.com') }
  it { expect(subject.total_count).to eq(3) }
  it { expect(subject.aggregation_date).to eq(Date.parse('2021-01-23')) }
end