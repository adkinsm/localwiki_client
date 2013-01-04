require_relative '../../lib/local_wiki'

describe 'saltlakewiki.org' do

  subject { LocalWiki.new 'saltlakewiki.org' }

  it {should be_currently_online}

  context '#time_zone' do
    it {subject.time_zone.should eq 'America/Chicago' }
  end

  context '#language_code' do
    it {subject.language_code.should eq 'en-us'}
  end

  context '#total_resources("user")' do
    it {subject.total_resources('user').to_i.should > 2}
  end

end
