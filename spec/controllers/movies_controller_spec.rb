require 'spec_helper'

describe MoviesController do
    
    describe 'searching for movies by director' do
        before :each do
            @fake_results= mock(Movie, :title => "Shaktimaan", :director => "director", :id => '1')
        end
        it 'tests movies by same director' do
            Movie.stub!(:find).with('1').and_return(@fake_results)
            get :find_similar_director, {:id =>'1'}
        end
        
    end
end