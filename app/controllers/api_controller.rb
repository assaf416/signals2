class ApiController < ApplicationController
  skip_before_action :authenticate_user!

  def tase_211
    render :plain => TaseAccount.all.to_json
  end

  def tase_226
    render :plain => TaseOrder.where(:kind => "226").order("filled_at ASC").to_json
  end

  def tase_229
    render :plain => TaseOrder.where(:kind => "229").order("filled_at ASC").to_json
  end
end
