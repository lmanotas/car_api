require 'spec_helper'

describe CarApi do
  subject(:json_response){ JSON.parse(last_response.body) }

  context 'searching for cars' do
    subject(:cars){ json_response['cars'] }
    subject(:car){ cars.first }
    subject(:cars_length){ cars.length }

    before { get "/cars?location=51.5444204,-0.22707" }

    it { expect(last_response).to be_ok }
    it { expect(cars_length).to eq(10) }
    it { expect(car['description']).not_to be_nil }
    it { expect(car['latitude']).not_to be_nil }
    it { expect(car['longitude']).not_to be_nil }
  end

  context 'errors responses' do
    subject(:error_code){ json_response['error']['code'] }
    before { get '/someunexistingroute' }

    it { expect(last_response).not_to be_ok }
    it { expect(error_code).to eq(404) }
  end
end