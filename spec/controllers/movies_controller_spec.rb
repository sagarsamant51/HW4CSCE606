require 'spec_helper'
describe MoviesController do
    it 'should render the #index template' do
        get :index
        response.should render_template :index
    end
    it 'should assign the requested contact to @movie' do
        movie=FactoryGirl.create(:movie)
        get :show, :id =>movie
        assigns(:movie).should eql movie
    end
    
    it 'should render the show view' do
        movie=FactoryGirl.create(:movie)
        get :show, :id =>movie
        response.should render_template :show
    end
    
    it 'should render the find_similar_director view' do
        movie=FactoryGirl.create(:movie,:director =>'Sagar')
        movie1=FactoryGirl.create(:movie,:director=>'Sagar',:title=>'Vinashak')
        post :find_similar_director,:id => movie.id
        response.should render_template :find_similar_director
    end
    
     it 'should redirect to the homepage view' do
        movie=FactoryGirl.create(:movie)
        post :find_similar_director,:id => movie.id
        response.should redirect_to root_path
        expect(flash[:warning]).to eq "'#{movie.title}' has no director info"
    end
    
    
    it 'should Post the new movie' do
        post :create,:movie => FactoryGirl.attributes_for(:movie)
        response.should redirect_to movies_path
    end
end