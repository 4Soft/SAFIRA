class HumanResourcesController < ApplicationController
  def index
    @entrepreneurs = current_user.entrepreneurs
  end

  def create
    @entrepreneur = Entrepreneur.new(params[:entrepreneur].except(:custom_infos))
    @entrepreneur.enterprise = current_user

    params[:entrepreneur][:custom_infos].each do |info|
      @entrepreneur.custom_infos << CustomInfo.new(name: info[:name], value: info[:value])
    end

    @entrepreneur.save

    redirect_to human_resources_path
  end
end
