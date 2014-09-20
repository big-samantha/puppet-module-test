require 'spec_helper_acceptance'

case fact('osfamily')
when 'RedHat'
  sample_file  =  '/tmp/test_redhat_sample'
  file_content = 'This is a RedHat based system'
when 'Debian'
  sample_file  = '/tmp/test_debian_sample'
  file_content = 'This is a Debian based system'
end

describe 'sample_test class:', :unless => UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do
  it 'should run successfully' do
    pp = "class { 'sample_test': }"

    # Apply twice to ensure no errors the second time.
    apply_manifest(pp, :catch_failures => true) do |r|
      expect(r.stderr).not_to match(/error/i)
    end
    apply_manifest(pp, :catch_failures => true) do |r|
      expect(r.stderr).not_to eq(/error/i)

      expect(r.exit_code).to be_zero
    end
  end

  describe 'should create a sample file with right content by default' do
    describe file("#{sample_file}") do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      its(:content) { should match file_content }
    end
  end

end
