require 'rack-flash'
class SongsController < ApplicationController
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        erb :'songs/new'
    end
    
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    post '/songs' do
        @song = Song.create(params[:song])
        if Artist.find_by(name: params[:artist][:name])
            x = Artist.find_by(name: params[:artist][:name])
            @song.artist = x
        else
            @song.artist = Artist.create(name: params[:artist][:name])
        end
        if !params[:genre][:name].empty?
            @song.genres << Genre.create(params[:genre])
        end
        @song.genre_ids = params[:genres]
        @song.save
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        if Artist.find_by(name: params[:artist][:name])
            x = Artist.find_by(name: params[:artist][:name])
            @song.artist = x
        else
            @song.artist = Artist.create(name: params[:artist][:name])
        end
        @song.genre_ids = params[:genres]
        @song.save
        flash[:message] = "Successfully updated song."
        redirect("/songs/#{@song.slug}")
    end
end