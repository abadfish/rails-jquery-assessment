class Post < ActiveRecord::Base
  belongs_to :author

  def list_headlines
    n = News.new(news_source)
    @headlines = n.get_titles
  end


end
