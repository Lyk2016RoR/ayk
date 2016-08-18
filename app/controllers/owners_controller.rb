class OwnersController < ApplicationController
  before_action :set_ibdb, only:[ :show, :update, :edit, :destroy]


end
