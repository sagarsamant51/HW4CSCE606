require 'spec_helper'

describe Movie do
    it 'should have a valid name' do
        FactoryGirl.build(:movie,:title=>nil).should_not be_valid
    end
    
    it 'should update the director info' do
        movie1=FactoryGirl.create(:movie,:title =>'Sinduja',:rating => 'PG',:director => nil )
        movie1.director='Anuja'
        movie1.director.should eql 'Anuja'
    end
    
    describe 'find all by director' do
        before :each do
            @ridley=FactoryGirl.create(:movie,:title =>'flash',:rating => 'PG' , :director => 'Ridley')
            @ridley1= FactoryGirl.create(:movie, :title => 'Justice league', :rating => 'PG', :director => 'Ridley')
            @ridley2= FactoryGirl.create(:movie, :title => 'Justice league-1', :rating => 'PG', :director => 'Scott')
            @ridley3 = FactoryGirl.create(:movie, :title => 'Justice league-1', :rating => 'PG', :director => nil)
        end
        context 'it has a director' do
            it 'returns a list of director' do
                Movie.find_similar_movies(@ridley).should eql [@ridley,@ridley1]
                Movie.find_similar_movies(@ridley).should_not include @ridley2
            end
        end
    end
end