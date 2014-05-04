base:
  "*":
    - users
    - firewall

  "roles:salt":
    - match: grain
    - firewall.salt

  "roles:web":
    - match: grain
    - web.bootstrap
    - web.redirect
