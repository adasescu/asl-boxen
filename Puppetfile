# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.7.0"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.7.1"
github "go",          "2.0.3", :repo => "jchenry/puppet-go"
github "homebrew",    "1.9.8"
github "hub",         "1.3.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.4"
github "nodejs",      "4.0.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.7"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

github "openstack_clients", "0.0.5",  :repo => "jchenry/puppet-openstack_clients"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "python", "2.0.0"
github "vmware_fusion", "1.2.0"
github "vagrant",    "3.0.10"
github "packer", "1.4.0.hpcloud", :repo => "hpcloud/puppet-packer"

github "chrome",     "1.1.2"
github "hipchat",     "1.1.3"
github "tunnelblick",     "1.0.7"


github "osx",        "2.7.0"

#colin's apps
github "dropbox",    "1.4.0"
github "spotify",    "1.0.1"
github "fonts",	     "0.0.3"
github "atom",       "1.0.0"
github "quicksilver", "1.3.0"
github "colloquy", "1.0.0"
