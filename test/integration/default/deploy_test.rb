# InSpec test for recipe .::deploy

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe file('/var/lib/tomcat9/webapps/gameoflife.war') do
  it { should exist }
end
