class sample_test (
  $sample_file  = $sample_test::params::sample_file,
  $file_content = $sample_test::params::file_content,
) inherits sample_test::params {

  validate_absolute_path($sample_file)
  validate_string($file_content)

  file { 'sample_file':
    ensure  => 'file',
    path    => $sample_file,
    content => $file_content,
    owner   => 'root',
    group   => 'root',
  }

}
