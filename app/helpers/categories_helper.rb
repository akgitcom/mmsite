module CategoriesHelper

  # encoding: utf-8
  require 'ruby-pinyin'

  def topinyin(txt)
    PinYin.permlink(txt)
  end
end
