require 'sinatra'
require './contact'
require './rolodex'

@@rolodex = Rolodex.new
@@rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))

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

get "/contacts/1000" do
  @contact = @@rolodex.find(1000)
  erb :show_contact
end
