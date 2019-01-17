describe BookValidator do
  let(:result) { described_class.new(data).validate }
  let(:data) { { title: 'foo', author: 'bar' } }

  describe 'with good data' do
    it 'is valid' do
      expect(result).to be_a_success
    end
  end

  it 'requires title' do
    data.delete(:title)
    expect(result).to be_a_failure
  end

  it 'requires author' do
    data.delete(:author)
    expect(result).to be_a_failure
  end
end
