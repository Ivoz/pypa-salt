firewall:
  services:
    http:
      ips_allow:
        - 0.0.0.0/0

web:
  redirect:
    .pip-installer.org: pip.pypa.io
    .virtualenv.org: virtualenv.pypa.io
