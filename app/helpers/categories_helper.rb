module CategoriesHelper

  # encoding: utf-8
  require 'ruby-pinyin'

  def topinyin(txt)
    PinYin.permlink(txt)
  end
  def display_categories(categories)
    ret = "<ul>"
    for category in categories
      if category.pid == 0
        ret << "<li class='top'>"
        ret << link_to(category.title)
        ret << find_all_subcategories(category)
        ret << "</li>"
      end
    end
    ret << "</ul>"
  end

  def find_all_subcategories(category)
    if category.children.size > 0
      ret = '<ul>'
      category.children.each { |subcat|
        if subcat.children.size > 0
          ret << '<li>'
          ret << h(subcat.title)
          ret << find_all_subcategories(subcat)
          ret << '</li>'
        else
          ret << '<li>'
          ret << h(subcat.title)
          ret << '</li>'
        end
      }
      ret << '</ul>'
    end
  end
end
