require 'ElevatorMedia/streamer'
require 'rest-client'
# require 'rails_helper'
require 'spec_helper'
describe 'Streamer' do
    
    let!(:streamer){Streamer.new}

    it "a passing test" do
        expect(true).to be true
    end

    it "should respond to getContent" do
        expect(streamer).to respond_to(:getContent)        
    end

    # Testing the getContent method and what it returns
    describe "getContent behavior" do

        it "should return a valid html" do    
            result = streamer.getContent()
            expect(result).to be_a(String)
            expect(result).to include('<')
        end

        it "should get interesting html from internet" do
           expect(streamer).to receive(:getHtmlFromCloud)
           streamer.getContent()
        end

        it "default content should be of 'chuck_norris' type" do
            expect(streamer).to receive(:getChuckNorrisQuote).and_return({value: {joke: 'Chuck Norris joke received'}}.to_json) 
            streamer.getContent('chuck_norris')
        end

        it "should be able to fetch weather data" do
            expect(streamer).to receive(:getWeather) {'<div>weather</div>'}
            streamer.getContent()
        end

        it "should return false if key is invalid" do
            fromcloud = streamer.getHtmlFromCloud('')
            expect(fromcloud).to be_nil
        end
    


    end


end