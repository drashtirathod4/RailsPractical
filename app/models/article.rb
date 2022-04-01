class Article < ApplicationRecord
    has_many :articles_comments
    mount_uploader :image, ImageUploader
end
