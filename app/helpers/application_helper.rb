module ApplicationHelper
  # ページごとの完全なタイトルを返す
  # full_titleのメソッドを定義。引数に渡された各ページごとのタイトルがあれば、base_titleと一緒に描画する。
  def full_title(page_title = "")
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
