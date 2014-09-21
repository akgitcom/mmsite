module SinglepagesHelper
  def safe_content(content)
    sanitize CGI.unescapeHTML(content),tags: %w(table tr td img), attributes: %w(id class src)
  end
end
