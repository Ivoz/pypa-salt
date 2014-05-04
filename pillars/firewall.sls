firewall:
  install: True
  enabled: True
  strict: True

  services:
    "4505:4506":  # salt
      ips_allow:
        - 0.0.0.0/0
