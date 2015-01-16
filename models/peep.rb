class Peep

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime
  property :posted_by, String  

  belongs_to :user

end