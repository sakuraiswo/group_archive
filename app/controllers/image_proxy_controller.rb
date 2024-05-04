class ImageProxyController < ApplicationController
  require 'net/http'

  before_action :set_cors_headers

  def show
    url = params[:url]
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      send_data response.body, type: response['Content-Type'], disposition: 'inline'
    else
      head :not_found
    end
  end


  private
  
  def set_cors_headers
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

end


