class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  # get "/" do
  #   { message: "Good luck with your project!" }.to_json
  # end

  get '/manufacturers' do
    manufacturers = Manufacturer.all
    # binding.pry
    manufacturers.to_json(include: [:vehicle_models])
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

  get '/vehicle_models' do
    vehicle_models = VehicleModel.all 
    vehicle_models.to_json
  end

  post '/vehicle_models/new' do 
    vehicle_model = VehicleModel.create(
      name: params[:name],
      type: params[:type],
      years_made: params[:years_made],
      description: params[:description],
    )
  end

  patch '/vehicle_models/:id' do
    vehicle_model = VehicleModel.find(params[:id])
    vehicle_model.update(
      name: params[:name],
      type: params[:type],
      years_made: params[:years_made],
      description: params[:description],
    )
    vehicle_model.to_json
  end

  delete '/vehicle_models' do
    vehicle_model = VehicleModel.find(params[:id])
    vehicle_model.destroy
    vehicle_model.to_json
  end

end
