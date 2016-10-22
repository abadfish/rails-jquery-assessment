class Post < ActiveRecord::Base

  def list_headlines
    n = News.new(news_source)
    @headlines = n.get_titles
  end

  def tag_name=(name)
    self.tag = Tag.find_or_create_by(name: name)
  end

  def tag_name
    self.tag.name if self.tag
  end

  def self.with_tag(tag_id)
    where(tag: tag_id)
  end

end
