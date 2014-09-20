## Default values for a simple sample test
class sample_test::params {

  case $::osfamily {
    'Debian': {
      $sample_file  = '/tmp/test_debian_sample'
    }
    'RedHat': {
      $sample_file = '/tmp/test_redhat_sample'
    }
    default: {
      fail("${module_name} is not supported on ${::osfamily}")
    }
  }

  $file_content = "This is a ${::osfamily} based system\n"

}
