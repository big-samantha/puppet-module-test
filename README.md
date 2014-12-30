# Sample Test Module

## Overview

This is a simple Puppet module that aims to provide a simple example of
module testing.  Included are unit tests and acceptance tests.

Unit tests are used to determine if a catalog can compile and if it looks the
way we expect it to with specific parameters.

Acceptance tests are used to determine if applying a module to a system
results in the expected state.

This uses [rspec-puppet](http://rspec-puppet.con) for unit tests and
[beaker-rspec](https://github.com/puppetlabs/beaker/wiki/How-to-Write-a-Beaker-Test-for-a-Module)
for acceptance tests.

**Relevant resources:**

[puppetlabs_spec_helper](https://github.com/puppetlabs/puppetlabs_spec_helper)
is used to make unit testing more convenient and easy.

[Serverspec](http://serverspec.org/) is what our acceptance tests are written
with.

## Getting Set Up

### Basic Procedure

```shell
gem install bundler
bundle install                    # Install the required Rubygems
```

## Running Tests

### Unit Tests (rspec-puppet)

```shell
bundle exec rake spec
```

### Acceptance Tests (beaker-rspec)

```shell
bundle exec rspec spec/acceptance # Acceptance tests (beaker-rspec)
```

Test it on Ubuntu:

```shell
BEAKER_setfile=spec/acceptance/nodesets/ubuntu-server-1404-x64.yml rake beaker
```

### Rake tasks

The following will list some Rake tasks that you might find useful:

```shell
rake -T
```

A couple of useful rake taks for this example:

```shell
rake lint    # puppet-lint
rake syntax  # Puppet syntax check (manifests and templates)
```


## Module Boilerplate

###`.fixtures`

This file defines a "sandbox" for our unit tests. Essentially, any dependencies
that our module has will be listed in here so that they can be retrieved and
placed in a "sandbox" during our tests.  We also list our module here to make
it available in the sandbox. See `spec/fixtures` below.

This is a feature of the [puppetlabs_spec_helper](https://github.com/puppetlabs/puppetlabs_spec_helper)

###`Gemfile`

This file lists what Rubygems are needed for this module's tests.  Used with
[Bundler](http://bundler.io/), this will install the required Gems and their
dependencies.

###`Rakefile`

Provides "tasks" for making running the tests easier.  Also specifies which
libraries to use for the tests.  Sometimes, this can also provide
configuration options.  In this example module, we pass some puppet-lint
options.

###`.rspec`

Options for rspec.  Simple and not required.

###`spec/`

This directory contains all of our tests and testing data.

###`spec/spec_helper.rb`

A "helper" for our unit tests.  In our case, we're just using the
[puppetlabs_spec_helper](https://github.com/puppetlabs/puppetlabs_spec_helper),
and this file just requires that.

Think of this as something like a standard library (stdlib) for module testing -
useful, reusable code for testing.

###`spec/spec_helper_acceptance`

Similar to the regular `spec_helper` file, but this is specifically for our
acceptance tests.

###`spec/fixtures`

This directory isn't directly used by the end user.  puppetlabs_spec_helper
uses this as a "sandbox" for running tests.  See `.fixtures` above.

This is a feature of the [puppetlabs_spec_helper](https://github.com/puppetlabs/puppetlabs_spec_helper)


### Acceptance Tests

####`spec/acceptance`

Our acceptance tests.  We use [Beaker-rspec](https://github.com/puppetlabs/beaker/wiki/How-to-Write-a-Beaker-Test-for-a-Module)
for these.

####`spec/acceptance/nodesets`

Contains files that specify what types of systems should be available for our
Beaker tests.

####`spec/acceptance/sample_test_spec.rb`

This is the main spec test for our module.  Refer to [Serverspec](http://serverspec.org/)
for information on how to write these tests.

####`spec/acceptance/unsupported_spec.rb`

This is a test for unsupported platforms.  This module isn't actually setup to
use this, but it's there for reference.  Basically, this should test that the
module fails.

### Unit Tests

####`spec/classes`

This contains our unit tests, utilizing [rspec-puppet](http://rspec-puppet.com/)

####`spec/classes/sample_test_spec.rb`

This is a unit test for our module.  You'll notice it contains almost three
times as many lines as our module code itself!

## Contributions

Contributions are more than welcome.  Keep in mind this is supposed to be a
fairly simple example ;)

## Authors

Josh Beard, [beard@puppetlabs.com](mailto:beard@puppetlabs.com)
