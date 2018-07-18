class PetsController < ApplicationController
    get '/pets' do #read - all
      @pets = Pet.all
      erb :'/pets/index'
    end

    get '/pets/new' do #create - get
      erb :'/pets/new'
    end

    post '/pets' do #create - post
      @pet = Pet.create(params[:pet])
      if !params["owner"]["name"].empty?
        @pet.owner = Owner.create(name: params["owner"]["name"])
      end
      @pet.save
      redirect to "/pets/#{@pet.id}"
    end

    get '/pets/:id' do #read - single
      @pet = Pet.find(params[:id])
      erb :'/pets/show'
    end

    post '/pets/:id' do #update - post
      @pet = Pet.find(params[:id])
      @pet.update(params["pet"])
      if !params["owner"]["name"].empty?
        @pet.owner = Owner.create(name: params["owner"]["name"])
      end
      @pet.save
      redirect to "/pets/#{@pet.id}"
    end

    get '/pets/:id/edit' do #update - get
      @pet = Pet.find(params[:id])
      erb :'/pets/edit'
    end
end
