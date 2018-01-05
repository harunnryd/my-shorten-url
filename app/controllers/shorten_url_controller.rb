class ShortenUrlController < ApplicationController
  def index
    @shorten_url = ShortenUrlForm::Create.new
  end

  def show
    success = -> (obj) { redirect_to(obj.url) }
    failure = -> { redirect_to root_path }
    ShortenUrlService::Show.call(params[:url], success: success, failure: failure)
  end

  def create
    response = -> (obj) do
      @shorten_url = obj
      respond_to(:js)
    end
    ShortenUrlService::Create.call(shorten_url_params, response: response)
  end

  private
    def shorten_url_params
      params.require(:shorten_url).permit(:custom, :url, :shorten)
    end
end
