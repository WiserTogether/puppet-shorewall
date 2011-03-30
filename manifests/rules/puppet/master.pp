class shorewall::rules::puppet::master {
    include ::shorewall::rules::puppet
    shorewall::rule { "$shorewall_puppetserver_zone-me-tcp_puppet-main":
        source          => '$PUPPETSERVER_ZONE',
        destination     => '$FW',
        proto           => 'tcp',
        destinationport => '$PUPPETSERVER_PORT,$PUPPETSERVER_SIGN_PORT',
        order           => 240,
        action          => 'ACCEPT';
    }
}
