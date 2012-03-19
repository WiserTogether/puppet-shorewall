define shorewall::host(
    $zone,
    $nickname=$title,
    $options = 'tcpflags,blacklist,norfc1918',
    $order='100'
){
    shorewall::entry{"hosts.d/${order}-${nickname}":
        line => "${zone} ${name} ${options}"
    }
}

