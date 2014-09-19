class CategoriesController < ApplicationController
  def index
    @categories = Category.order("cid DESC").page(params[:page]).per(5)
    @title = 'Category manage'

    @c = Category.all
    hash = {'a'=>{1=>10,2=>20},'b'=>{3=>30,4=>40}}
    hash.each{|key1, hash1|
      print "hash #{key1} has keys:", hash1.keys.join(','), "\n"
    }
  end
  def show
    @categories = Category.find_by_cid(params[:id])
  end
end
