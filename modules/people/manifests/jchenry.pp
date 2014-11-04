class people::jchenry {
  include chrome
  #include spotify
  include dropbox
  include homebrew
  include quicksilver
  include colloquy

  #Github Atom Editor
  include atom
  exec { 'atom-install-stars':
      command => "${boxen::config::bindir}/apm stars --install",
  }
  include fonts::google::droidsansmono


  #Personal OS X setting
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::finder::show_hidden_files
  include osx::finder::empty_trash_securely
  include osx::disable_app_quarantine

  osx::dock::hot_corner { 'Bottom Right':
    action => 'Start Screen Saver'
  }
  osx::recovery_message { 'if found please contact colin@jchenry.me': }

  boxen::osx_defaults { 'Disable Dashboard':
    key    => 'mcx-disabled',
    domain => 'com.apple.dashboard',
    value  => 'YES',
  }
  boxen::osx_defaults { 'Disable reopen windows when logging back in':
    key    => 'TALLogoutSavesState',
    domain => 'com.apple.loginwindow',
    value  => 'false',
  }
  boxen::osx_defaults { 'Do not create .DS_Store':
    key    => 'DSDontWriteNetworkStores',
    domain => 'com.apple.dashboard',
    value  => 'true',
  }



  #Handle dotfiles & scripts
  $home      = "/Users/${::luser}"
  $developer = "${home}/Developer/"
  $dotfiles  = "${developer}src/github.com/jchenry/dotfiles"
  $scripts  = "${developer}src/github.com/jchenry/scripts"


  file { $developer:
    ensure => "directory"
  }

  repository { $scripts:
    source  => 'jchenry/scripts',
    require => File[$developer],
    notify  => Exec['setup-scripts']
  }

  exec { 'setup-scripts':
    # cwd => $scripts,
    command => "$scripts/setup.sh"
  }


  repository { $dotfiles:
    source  => 'jchenry/dotfiles',
    require => File[$developer],
    notify  => Exec['setup-dotfiles','atom-install-stars']
  }

  exec { 'setup-dotfiles':
    # cwd => $dotfiles,
    command => "$dotfiles/setup.sh"
  }

}
