base:
  "*":
    - base.autostate
    - base.sanity
    - base.sudo
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
  #   - web.redirect
