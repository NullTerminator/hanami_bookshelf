class Book < Hanami::Entity
  attributes do
    attribute :id,      Types::Int
    attribute :title,   Types::String
    attribute :author,  Types::String
  end
end
