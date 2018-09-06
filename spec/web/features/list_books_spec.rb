require 'features_helper'

describe 'List books' do
  let(:repo) { BookRepository.new }

  before do
    repo.clear

    repo.create(title: 'PoEAA', author: 'Martin Fowler')
    repo.create(title: 'TDD', author: 'Kent Beck')
  end

  it 'displays each book on the page' do
    visit '/books'

    within '#books' do
      expect(page).to have_css('.book', count: 2)
    end
  end
end
