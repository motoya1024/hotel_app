module ApplicationHelper
  def full_title(page_title = '')
    base_title = "ホテル情報検索・投稿サイト"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
