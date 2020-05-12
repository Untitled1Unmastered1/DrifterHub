DrifterHub 


MODELS:

Post *if we include categories, join table: joining categories & users 
    -belongs to :user 
    -has_many :comments
    -has_many :users, through :comments 
    - belongs_to :category 
    - attributes: title, content 


User 
    - has_many :posts 
    - has_many :comments
    - has_many :commented_posts, through :comments
    - has_many :categories, through :posts 
    - attributes: username, email, password_digest 


Comment *if no categories, join table: joining users and posts 
    -belongs_to :user
    -belongs_to :post 
    -attribute: content 


Categories 
    - has_many :posts 
    - has_many :users, through :posts 
    -attributes: name
