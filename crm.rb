require 'sinatra'
require './contact'
require './rolodex'

$rolodex = Rolodex.new
# $rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))

# $rolodex = Rolodex.new


get '/' do 

	@crm_app_name = "Steinunn's CRM"

	erb :index, :layout => :layout 
	
end

get '/contacts' do
	
	erb :contact
end

get '/contacts/new' do

	erb :new_contact

end

post '/contacts' do

	puts params	
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	$rolodex.add_contact(new_contact)
 	redirect to ('/contacts')
end

get "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end