require 'spec_helper'

describe OmniAuth::Strategies::Miil do
  let(:access_token) { double('AccessToken', :options => {}) }
  let(:parsed_response) { double('ParsedResponse') }
  let(:response) { double('Response', :parsed => parsed_response) }

  subject do
    OmniAuth::Strategies::Miil.new({})
  end

  before(:each) do
    subject.stub(:access_token).and_return(access_token)
  end

  context "client options" do
    it 'should have correct site' do
      subject.options.client_options.site.should eq("https://miil.me")
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://miil.me/oauth/authorize')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('https://miil.me/oauth/token')
    end

    it "should allow users to override the default redirect_uri if provided" do
      custom_client = OmniAuth::Strategies::Miil.new('MIIL_APP_KEY', 'MIIL_SECRET_KEY', client_options: { redirect_uri: "http://test.com/callback" })
      custom_client.options.client_options.redirect_uri.should eq "http://test.com/callback"
    end
  end

  context "#raw_info" do
    it "should use relative paths" do
      access_token.should_receive(:get).with('/api/users/info').and_return(response)
      subject.raw_info.should eq(parsed_response)
    end
  end
end
