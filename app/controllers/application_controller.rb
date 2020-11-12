class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Basic::ControllerMethods

  #Basic Auth
  http_basic_authenticate_with name: 'agendaEdu', password: 'rubyAgenda'
end
