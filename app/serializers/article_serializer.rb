class ArticleSerializer < ActiveModel::Serializer
  attributes :title, :body, :release_date
end
