require 'spec_helper'

describe CarApi do
  subject(:json_response){ JSON.parse(last_response.body) }

  context 'searching for cars' do
    subject(:cars){ json_response['cars'] }
    subject(:car){ cars.first }
    subject(:cars_length){ cars.length }

    before { get "/cars?location=51.5444204,-0.22707" }

    it { expect(cars_length).to be > 0 }
    it { expect(car['description']).not_to be_nil }
    it { expect(car['latitude']).not_to be_nil }
    it { expect(car['longitude']).not_to be_nil }
  end

  context 'errors responses' do
    subject(:error_code){ json_response['error']['code'] }
    context 'not found error' do
      before { get '/someunexistingroute' }

      it { expect(error_code).to eq(404) }
    end

    context 'Bad Request formats' do
      before { get "/cars?location=#{location}" }

      context 'No content on locations' do
        let(:location){ '' }

        it { expect(error_code).to eq(400) }
      end

      context 'Wrong location format (lat,lon)' do
        let(:location){ '51.4423,' }
        
        it { expect(error_code).to eq(400) }
      end
    end
  end
end