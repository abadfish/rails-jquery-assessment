class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  def list_headlines
    n = News.new(news_source)
    @headlines = n.get_titles
  end

  def author_name=(name)
    self.author = Author.find_or_create_by(name: name)
  end

  def author_name
    self.author.name if self.author
  end

  def self.with_author(author_id)
    where(author: author_id)
  end

end
