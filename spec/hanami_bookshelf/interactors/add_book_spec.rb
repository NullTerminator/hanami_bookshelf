require 'spec_helper'

describe AddBook do
  let(:interactor) { described_class.new }
  let(:attrs) { Hash[title: 'Foobar', author: 'That Guy'] }

  context 'with good input' do
    let(:result) { interactor.call(attrs) }

    it 'succeeds' do
      expect(result).to be_a_success
    end

    it 'creates a book with correct title and author' do
      expect(result.book.title).to eq attrs[:title]
      expect(result.book.author).to eq attrs[:author]
    end
  end

  describe 'persistence' do
    let(:repo) { instance_double('BookRepository') }

    it 'persists the book with the repo' do
      expect(repo).to receive(:create).with(attrs)
      AddBook.new(repo: repo).call(attrs)
    end
  end

  describe 'sending email' do
    let(:mailer) { instance_double('Mailers::BookAddedNotification') }

    it 'sends :deliver to the mailer' do
      expect(mailer).to receive(:deliver)

      AddBook.new(mailer: mailer).call(attrs)
    end
  end
end
