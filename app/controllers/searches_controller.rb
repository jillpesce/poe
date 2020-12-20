class SearchesController < ApplicationController
    def show
        search_term = params['q'].capitalize

        url = "https://poetrydb.org/title/#{params[:q]}/lines.json"
        response = HTTParty.get(url).to_s
        json = JSON.parse(response)
        poem = json[0]["lines"]
        puts poem
        if poem
              @poem = poem
              @title = params[:q]
         else
              render :new
         end
    end
end
