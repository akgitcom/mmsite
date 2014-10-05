class CategoriesController < ApplicationController
  def index
    @category = Category.order("cid DESC").page(params[:page]).per(5)
    @title = 'Category manage'

    @c = Category.all
    hash = {'a'=>{1=>10,2=>20},'b'=>{3=>30,4=>40}}
    hash.each{|key1, hash1|
      print "hash #{key1} has keys:", hash1.keys.join(','), "\n"
    }
  end

  def show
    @category = Category.find_by_cid(params[:cid])
    redirect_to not_found_path unless @category
  end
  def index(id = params[:node])
    respond_to do |format|
      format.html # render static index.html.erb
      format.json { render :json => Category.find_children(id) }
    end
  end
  #首先先得到树的根节点，再根据传过来的id找到根的子节点
  def self.find_children(start_id = nil)
    start_id.to_i == 0 ? root_nodes : find(start_id).direct_children
  end
  #如果parent_id为空，则为树的根节点
  def self.root_nodes
    find(:all, :conditions => 'parent_id IS NULL')
  end
end
