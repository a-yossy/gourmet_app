class SearchesController < ApplicationController
  require 'net/http'

  def index
    if freeword = params[:freeword] 
      address = params[:address]
      keyid = ENV["key_gnavi"]
      params_1 = URI.encode_www_form({keyid: keyid})
      params_2 = URI.encode_www_form({freeword: freeword})
      params_3 = URI.encode_www_form({address: address})
      uri = URI.parse("https://api.gnavi.co.jp/RestSearchAPI/v3/?#{params_1}&#{params_2}&#{params_3}&hit_per_page=100")
      response = Net::HTTP.get_response(uri)
      results = JSON.parse(response.body)
      if results["rest"]
        @count=results["total_hit_count"]
        restaurants = results["rest"]
        @restaurants = Kaminari.paginate_array(restaurants).page(params[:page]).per(5)
      else
        flash[:danger] = "条件に一致する結果は見つかりませんでした。"
        redirect_to root_path
      end
    end
  end

  def show
    @restaurant = params["rest"]
    @key = ENV["key_map"]
  end

end