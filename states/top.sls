base:
  "*":
    - base.autostate
    - base.sanity
    - wheel
    - users
    - monitoring
    - unattended-upgrades
    - firewall

  "roles:salt":
    - match: grain
    - base.gitsync

  "roles:web":
    - match: grain
    - web.bootstrap
    - web.redirect
