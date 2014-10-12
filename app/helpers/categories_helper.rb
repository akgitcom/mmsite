module CategoriesHelper

  # encoding: utf-8
  require 'ruby-pinyin'
  def get_parent(a)
    b=[]
    ret = '<div>'
    while 1
      b << a
      if a.parent
        a = a.parent
      else
        break
      end
    end
    for c in b.reverse
      ret << " > " + c.title
    end
    ret << "</div>"
  end


  def topinyin(txt)
    PinYin.abbr(txt)
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
