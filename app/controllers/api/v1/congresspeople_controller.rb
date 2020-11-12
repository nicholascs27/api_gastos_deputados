class Api::V1::CongresspeopleController < ApplicationController

  def index
    congresspeople = Congressperson.all.includes(:yearly_spends)
    
    render json: congresspeople.to_json
  end


end
