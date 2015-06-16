require 'docker'
require 'time'
require 'humanize-bytes'

Estibador::App.controllers :docker do

  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

  get :index do
    @resumen =  {
      :images => Docker::Image.all.length,
      :containers => {
        :stopped  => Docker::Container.all(:all => true).length,
        :active => Docker::Container.all.length
      }
    }
    render 'docker/index'
  end

  get :images do
    @images = []

    Docker::Image.all.each do |image|
      @images.push({
        :id =>  image.id.slice(0, 10),
        :date => Time.at(image.info["Created"]).httpdate,
        :tags => image.info["RepoTags"],
        :size => Humanize::Byte.new(image.info["VirtualSize"]).to_g.value.round(2)
      })
    end

    render 'docker/images'
  end
end
