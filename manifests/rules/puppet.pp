class shorewall::rules::puppet {
  case $shorewall_puppetserver {
    '': { $shorewall_puppetserver = "puppet.${domain}" } 
  }
  case $shorewall_puppetserver_port {
    '': { $shorewall_puppetserver_port = '8140' }
  }
  case $shorewall_puppetserver_signport {
    '': { $shorewall_puppetserver_signport = '8141' }
  }
  case $shorewall_puppetserver_zone {
    '': { $shorewall_puppetserver_zone = 'net' }
  }
  shorewall::params{
        'PUPPETSERVER':             value => $shorewall_puppetserver;
        'PUPPETSERVER_PORT':        value => $shorewall_puppetserver_port;
        'PUPPETSERVER_SIGN_PORT':   value => $shorewall_puppetserver_signport;
        'PUPPETSERVER_ZONE':         value => $shorewall_puppetserver_zone;
  }
}
