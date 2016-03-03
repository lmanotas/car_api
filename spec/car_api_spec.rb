require 'spec_helper'

describe CarApi do
  it do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('It Works!')
  end
end