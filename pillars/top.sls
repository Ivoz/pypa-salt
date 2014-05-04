base:
  "*":
    - users
    - firewall

  "roles:salt":
    - match: grain

  "roles:web":
    - match: grain
    - web.bootstrap
    - web.redirect
