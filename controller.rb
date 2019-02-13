require 'sinatra'

require_relative './database.rb'

get '/' do #root directory
    redirect '/Students'
end


#index
get '/Students' do 
    db = DBHandler.new
    @all_students = db.all #instance variable passes to view
    #all_students = students
    erb :application do 
        erb :index 
    end
end

#new
get '/Students/new' do
    erb :application do
        erb :new
    end
end

#create
post '/Students' do
  #  students << params[:newstudent]
    db = DBHandler.new
    db.create(params[:lastname_new], params[:firstname_new], params[:major_new], params[:email_new], params[:classyr_new], params[:graduated_new])
    @all_students = db.all
    redirect to '/Students'
end

#edit FIRST TO GET THE PAGE
get '/Students/:id/edit' do
    id = params[:id].to_i
    db = DBHandler.new
    @one_student = db.getStudent(id)
    erb :application do 
        erb :edit
    end
end
  
#update AFTER EDIT TO GET THE NEW DISPLAY   
post '/Students/:id' do
    id = params[:id].to_i
    db = DBHandler.new
    db.update(id, params[:lastname_new], params[:firstname_new], params[:major_new], params[:email_new], params[:classyr_new], params[:graduated_new])
    redirect '/Students/id'
end

#delete

get '/Students/:id/delete' do
    id = params[:id].to_i
    db = DBHandler.new
    db.destroy(id)
    redirect '/Students'
    
end

get '/Students/graduated' do
    db = DBHandler.new
    @all_students = db.getStudents(1)
    erb :application do
        erb :index
    end
end

get '/Students/show' do
    db = DBHandler.new
    @all_students = db.getStudents(0)
    erb :application do
        erb :index
    end
end

#show
get '/Students/:id' do
    sid = params[:id].to_i
    db = DBHandler.new
    @one_student = db.getStudent(sid)
   # @one_student = students[params[:id].to_i]
    erb :application do
        erb :show
    end
end