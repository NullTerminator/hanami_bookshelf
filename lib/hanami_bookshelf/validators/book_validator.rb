class BookValidator
  include Hanami::Validations

  validations do
    required(:title).filled(:str?)
    required(:author).filled(:str?)
  end
end
