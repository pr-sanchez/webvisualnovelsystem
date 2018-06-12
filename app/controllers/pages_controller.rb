class PagesController < ApplicationController

    def about
    end

    def home
        @posts = Post.order("created_at desc").limit(15).paginate(page: params[:page], per_page: 4)
    end
    
end
