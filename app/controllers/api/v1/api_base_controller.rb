class Api::V1::ApiBaseController < ApplicationController
    before_action :authenticate_user!
end
