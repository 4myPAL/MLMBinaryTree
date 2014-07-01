class NetworksController < ApplicationController
  def show
    @containers = Array.new
    @network = Network.find(params[:id])
    @networks = Network.get_tree(@containers, @network, true)
    render json: @networks, root: false
  end
end
