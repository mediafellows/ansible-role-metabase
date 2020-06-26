require 'spec_helper'

describe "Metabase setup" do
  describe user('metabase') do
    it { should exist }
  end

  describe file('/opt/metabase/') do
    it { should be_directory }
  end

  describe file('/opt/metabase/metabase.jar') do
    it { should be_file }
  end

  describe file('/etc/default/metabase') do
    it { should be_file }
    its(:content) { should include('MB_PASSWORD_COMPLEXITY=strong') }
    its(:content) { should include('MB_JETTY_PORT=3000') }
    its(:content) { should include('MB_DB_FILE=/opt/metabase/metabase.db') }
  end

  describe file('/etc/systemd/system/metabase.service') do
    it { should be_file }
    its(:content) { should include('EnvironmentFile=/etc/default/metabase') }
    its(:content) { should include('ExecStart=/usr/bin/java -jar /opt/metabase/metabase.jar') }
  end

  describe service('metabase') do
    it { should be_enabled }
    it { should be_running }
  end
end
