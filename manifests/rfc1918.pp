define shorewall::rfc1918(
    $action = 'logdrop',
    $order='100'
){
    shorewall::entry{"rfc1918.d/${order}-${title}":
        line => "${name} ${action}"
    }   
}
