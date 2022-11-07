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
    vehicles.to_json(include: [:manufacturer])
  end

  post '/vehicles/new' do 
    manufacturer = Manufacturer.find_by(name: params[:manufacture_name])
    vehicle = Vehicle.create(
      name: params[:name],
      body_type: params[:body_type],
      years_made: params[:years_made],
      description: params[:description],
      manufacturer: manufacturer,
    )
    vehicle.to_json
  end

  patch '/vehicles/:id' do
    vehicle = Vehicle.find(params[:id])
    vehicle.update(
      name: params[:name],
      body_type: params[:body_type],
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
