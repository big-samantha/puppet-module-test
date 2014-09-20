describe 'unsupported distributions and OSes', :if => UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do
  it 'should fail' do
    pp = <<-EOS
    class { 'sample_test': }
    EOS
    expect(apply_manifest(pp, :expect_failures => true).stderr).to match(/is not supported on/i)
  end
end
