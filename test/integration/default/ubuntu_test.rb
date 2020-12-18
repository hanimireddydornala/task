# InSpec test for recipe .::ubuntu

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe package('openjdk-8-jdk') do
  it { should be_installed }
end

describe package('tomcat9') do
  it { should be_installed }
end

describe service('tomcat9') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/tomcat9/tomcat-users.xml') do
  it { should exists }
end

describe port(8080) do
  it { should be_listening }
end
