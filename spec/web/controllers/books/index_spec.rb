describe Web::Controllers::Books::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:repo) { BookRepository.new }

  before do
    repo.clear

    @book = repo.create(title: 'TDD', author: 'Kent Beck')
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes all books' do
    action.call(params)
    expect(action.exposures[:books]).to eq [@book]
  end
end
