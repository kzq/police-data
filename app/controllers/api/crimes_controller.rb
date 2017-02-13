class Api::CrimesController < ApplicationController
  require 'police_data_api'
  respond_to :json
  
  def index
    response = PoliceDataApi.street_level_crimes(lat: params[:lat], lng: params[:lng]);  
    data = PoliceDataService.new.street_level_crimes_data(response.body)
    render json: data.to_json
  end
end