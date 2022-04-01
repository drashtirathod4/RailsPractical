class ArticlesCommentSerializer < ActiveModel::Serializer
  attributes :comment, :date_of_comment, :article_id
end
