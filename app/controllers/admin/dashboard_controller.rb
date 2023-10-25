class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['Jungle'], password: ENV['Book']
  def show
  end
end
