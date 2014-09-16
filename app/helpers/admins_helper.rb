module AdminsHelper
  require 'open-uri'
  require 'json'
  def hello_world(name)
    "hello #{name}"
  end
  def get_location
    ip = request.remote_ip
    url = "http://ip.taobao.com/service/getIpInfo.php?ip=" + ip
    response = Net::HTTP.get_response(URI.parse(url)).body
    response = JSON.parse(response)['data']
  end

  def get_country
    response = get_location['country']
  end
end
