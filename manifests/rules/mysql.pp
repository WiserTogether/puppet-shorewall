class shorewall::rules::mysql {
  $mysql_zone = $mysql_zone ? { '' => 'net', default => $mysql_zone }

  shorewall::rule {
    "$mysql_zone-me-tcp_mysql":
      source          => "$mysql_zone",
      destination     => '$FW',
      proto           => 'tcp',
      destinationport => '3306',
      order           => 240,
      action          => 'ACCEPT';
  }
 
