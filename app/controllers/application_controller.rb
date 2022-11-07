class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  # get "/" do
  #   { message: "Good luck with your project!" }.to_json
  # end

  get '/manufacturers' do
    manufacturers = Manufacturer.all
    # binding.pry
    manufacturers.to_json(include: [:vehicles])
  end

  post '/manufacturers/new' do 
    manufacturer = Manufacturer.create(
      name: params[:name],
      based_in: params[:based_in],
      rank: params[:rank],
    )
    manufacturer.to_json
  end

  delete '/manufacturers/:id' do 
    manufacturer = Manufacturer.find(params[:id])
    manufacturer.destroy
    manufacturer.to_json
  end

  get '/vehicles' do
    vehicles = Vehicle.all 
    vehicles.to_json
  end

  post '/vehicles/new' do 
    vehicle = Vehicle.create(
      name: params[:name],
      type: params[:type],
      years_made: params[:years_made],
      description: params[:description],
    )
  end

  patch '/vehicles/:id' do
    vehicle = Vehicle.find(params[:id])
    vehicle.update(
      name: params[:name],
      type: params[:type],
      years_made: params[:years_made],
      description: params[:description],
    )
    vehicle.to_json
  end

  delete '/vehicles' do
    vehicle = Vehicle.find(params[:id])
    vehicle.destroy
    vehicle.to_json
  end

end
