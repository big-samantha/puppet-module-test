require 'spec_helper'

describe 'sample_test' do

  ## Default osfamily for the tests. Override in each context as needed.
  let :facts do
    {
      :osfamily        => 'RedHat',
      :operatingsystem => 'RedHat',
    }
  end

  ##
  ## Default parameters on a Debian system
  ##
  context "when on Debian with default params" do
    let (:facts) {{ :osfamily => 'Debian' }}

    it do should contain_file('sample_file').with(
      'content' => /This is a Debian based system/,
      'owner'   => 'root',
      'group'   => 'root',
      'path'    => '/tmp/test_debian_sample',
    )
    end

  end

  ##
  ## Default parameters on RedHat
  ##
  context "when on RedHat with default params" do
    it do should contain_file('sample_file').with(
      'content' => /This is a RedHat based system/,
      'path'    => '/tmp/test_redhat_sample',
    )
    end
  end

  ##
  ## A custom file and content should work
  ##
  context "when on RedHat with custom params" do

    let :params do
      {
        'sample_file'  => '/tmp/test_denver_hello',
        'file_content' => 'Hello from Denver',
      }
    end

    it do should contain_file('sample_file').with(
      'content' => /Hello from Denver/,
      'path'    => '/tmp/test_denver_hello',
    )
    end
  end

  ##
  ## When an absolute path isn't provided, we should get an error and not
  ## compile
  ##
  context "when an absolute path isn't provided" do

    let :params do
      {
        'sample_file' => 'not_absolute',
      }
    end

    it do
      expect {
        should compile
      }.to raise_error(Puppet::Error, /"not_absolute" is not an absolute path/)
    end
  end

  ##
  ## On Windows, the catalog should not compile
  ##
  context "when on Windows" do
    let (:facts) {{ :osfamily => 'Windows' }}

    it do
      expect {
        should compile
      }.to raise_error(Puppet::Error, /sample_test is not supported on Windows/)
    end
  end

end
