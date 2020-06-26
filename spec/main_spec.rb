require 'spec_helper'

describe "Metabase setup" do
  describe file('/opt/metabase/') do
    it { should be_directory }
  end

  describe file('/etc/systemd/system/metabase.service') do
    it { should be_file }
    its(:content) { should include('/opt/metabase/metabase.jar') }
  end
end
