firewall:
  services:
    9000:
      ips_allow:
        - 0.0.0.0/0

web:
  bootstrap:
    port: 9000
