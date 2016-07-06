class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  # new
  get '/recipes/new' do
    erb :new
  end

  # create
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  # index
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # show
  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id]) 
    erb :show
  end

  # edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  # update 
  post '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params)
    redirect "/recipes/#{@recipe.id}"
  end

  # delete
  post '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

  end


  
end






