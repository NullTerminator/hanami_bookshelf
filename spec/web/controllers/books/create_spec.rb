describe Web::Controllers::Books::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[book: { title: 'Confident Ruby', author: 'Avdi Grimm' }] }
  let(:repo) { BookRepository.new }

  after do
    repo.clear
  end

  it 'creates a new book' do
    action.call(params)
    book = repo.last

    expect(book.id).not_to be_nil
    expect(book.title).to eq params.dig(:book, :title)
  end
end
