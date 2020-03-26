class PagesController < ApplicationController

  def index
    res = {"working"=>"ok"}
    render :plain => res.to_json, status: 200, content_type: 'application/json'
  end   
    
end