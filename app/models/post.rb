class Post < ActiveRecord::Base
    belongs_to :user

    validates :title, :description, :image_url, presence: true
end
