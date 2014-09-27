class Singlepage < ActiveRecord::Base
  after_save :reload_routes

  def reload_routes
    DynamicRouter.reload
  end
end
