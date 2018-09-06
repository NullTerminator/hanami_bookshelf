describe Web::Controllers::Books::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[book: { title: 'Confident Ruby', author: 'Avdi Grimm' }] }
  let(:repo) { BookRepository.new }

  after do
    repo.clear
  end

  describe 'with valid params' do
    it 'creates a new book' do
      action.call(params)
      book = repo.last

      expect(book.id).not_to be_nil
      expect(book.title).to eq params.dig(:book, :title)
    end

    it 'redirects the user to the books listing' do
      response = action.call(params)

      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq '/books'
    end
  end

  describe 'with invaid params' do
    let(:params) { { book: {} } }

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:book, :title)).to eq ['is missing']
      expect(errors.dig(:book, :author)).to eq ['is missing']
    end
  end
end
