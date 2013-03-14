get '/' do
  erb :index
end

post '/urls' do
  check_url = Url.find_by_url(params[:url]) 

  if check_url.nil?
    url = Url.create(params)
    { "short_url" => url.short_url, "original_url" => url.url }.to_json
  else
    { "short_url" => check_url.short_url, "original_url" => check_url.url }.to_json
  end
end

get '/:short_url' do
  

  url_obj = Url.find_by_short_url(params[:short_url]) 
  url_obj.add_click;
  
  if url_obj.nil?
    @message = "http://long.er/" + params[:short_url]
    erb :index
  else
    redirect url_obj.url
  end 
  
end


