$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require File.expand_path("../../helper", __FILE__)
require 'localwiki_client'

if test_env_vars_set?

  describe 'LIVE testwiki instance' do

    before(:all) {
      @wiki = Localwiki::Client.new 'ec2-54-234-151-52.compute-1.amazonaws.com',
                                    ENV['localwiki_client_user'],
                                    ENV['localwiki_client_apikey']
      }

    context '#time_zone' do
      it {@wiki.time_zone.should eq 'America/Chicago' }
    end

    context "#create('page', 'TestPage<uuid>')" do

      it 'response.status is 201' do
        require 'securerandom'
        pagename = "TestPage#{SecureRandom.uuid}"
        response = @wiki.create('page', pagename, {})
        response.status.should eq 201
        # puts response.headers.inspect
        # puts response.headers["location"]
      end


    end

    contect "#fetch_version" do
      it 'check histoy resources' do
        subject.history_user_name.should eq ["adkinsm"]
        subject.history_date.should eq "Feb."
        subject.history_time.should eq 'America/Chicago'
        subject.history_comment.should eq ""

      end
    end

  end
end
