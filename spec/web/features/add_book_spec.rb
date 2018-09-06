require 'features_helper'

describe 'Add a book' do
  after do
    BookRepository.new.clear
  end

  it 'can create a new book' do
    visit '/books/new'

    within 'form#book-form' do
      fill_in 'Title', with: 'New Book'
      fill_in 'Author', with: 'Some Author'

      click_button 'Create'
    end

    expect(current_path).to eq '/books'
    expect(page).to include 'New Book'
  end
end
