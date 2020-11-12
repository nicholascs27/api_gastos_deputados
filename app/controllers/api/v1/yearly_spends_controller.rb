class Api::V1::YearlySpendsController < ApplicationController

  def index
    yearlySpends = YearlySpend.all

    render json: yearlySpends.to_json(include: :congressperson)
  end
end
