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
    expect(page).to have_content 'New Book'
  end

  it 'displays a list of errors when params contain errors' do
    visit '/books/new'

    within 'form#book-form' do
      click_button 'Create'
    end

    expect(current_path).to eq '/books'

    expect(page).to have_content 'There was a problem with your submission'
    expect(page).to have_content 'Title must be filled'
    expect(page).to have_content 'Author must be filled'
  end
end
