require 'hanami/interactor'

class AddBook
  include Hanami::Interactor

  expose :book

  def initialize(repo: BookRepository.new, mailer: Mailers::BookAddedNotification.new)
    @repo = repo
    @mailer = mailer
  end

  def call(book_attrs)
    @book = @repo.create(book_attrs)
    @mailer.deliver
  end
end
