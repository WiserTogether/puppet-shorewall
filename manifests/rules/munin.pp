class shorewall::rules::munin {
    shorewall::params { 'MUNINPORT': value => $munin_port ? { '' => 4949, default => $munin_port } }
    shorewall::params { 'MUNINCOLLECTOR': value => $munin_collector ? { '' => '127.0.0.1', default => $munin_collector } }
    shorewall::params { 'MUNINCOLLECTORZONE': value => $munin_collector_zone ? { '' => 'net', default => $munin_collector_zone } }
    shorewall::rule{" $munin_collector_zone-me-munin-tcp":
        source          => '$MUNINCOLLECTORZONE:$MUNINCOLLECTOR',
        destination     => '$FW',
        proto           => 'tcp',
        destinationport => '$MUNINPORT',
        order           => 240,
        action          => 'ACCEPT';
    }
}
