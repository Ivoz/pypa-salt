base:
  "*":
    - users

  "roles:salt":
    - match: grain
    - firewall.salt

  "roles:web":
    - match: grain
    - web.bootstrap
    - web.redirect
