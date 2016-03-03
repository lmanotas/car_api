require 'spec_helper'

describe CarApi do
  context 'errors responses' do
    subject(:json_response){ JSON.parse(last_response.body) }

    before { get '/someunexistingroute' }

    it { expect(last_response).not_to be_ok }
    it { expect(json_response['error']['code']).to eq(404) }
  end
end