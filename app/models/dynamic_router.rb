class DynamicRouter
  def self.load
    Rails.application.routes.draw do
      Singlepage.all.each do |pg|
        puts "Routing #{pg.routename}"
        get "/#{pg.routename}", :to => "singlepages#show", defaults: { sid: pg.sid }
      end
    end
  end

  def self.reload
    Rails::Application.routes_reloader.reload!
  end
end