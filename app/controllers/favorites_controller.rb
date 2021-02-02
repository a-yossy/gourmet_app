class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    restaurant_name      = params["rest_name"]
    restaurant_address   = params["rest_add"]
    restaurant_latitude  = params["rest_lat"]
    restaurant_longitude = params["rest_lng"]
    favorite = current_user.favorites.build(restaurant_name: restaurant_name, restaurant_address: restaurant_address)
    @restaurant = { "name" => restaurant_name, "address" => restaurant_address, "latitude" => restaurant_latitude, "longitude" => restaurant_longitude }
    if favorite.save
      flash[:success] = "お気に入り登録しました。"
    else
      flash[:danger] = "お気に入り登録出来ませんでした。"
    end
    redirect_to search_url(rest: @restaurant)
  end

  def destroy
    restaurant_name      = params["rest_name"]
    restaurant_address   = params["rest_add"]
    restaurant_latitude  = params["rest_lat"]
    restaurant_longitude = params["rest_lng"]
    favorite = current_user.favorites.find_by(restaurant_name: restaurant_name, restaurant_address: restaurant_address)
    @restaurant = { "name" => restaurant_name, "address" => restaurant_address, "latitude" => restaurant_latitude, "longitude" => restaurant_longitude }
    if favorite.present?
      favorite.destroy
      flash[:success] = "お気に入りから削除しました。"
    else
      flash[:danger] = "お気に入りから削除出来ませんでした。"
    end
    redirect_to search_url(rest: @restaurant)
  end

end
