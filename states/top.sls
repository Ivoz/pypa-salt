base:
  "*":
    - base.autostate
    - base.sanity
    - wheel
    - users
    - backups
    - monitoring
    - unattended-upgrades

  "roles:salt":
    - match: grain
    - base.gitsync

  "roles:web":
    - match: grain
    - web.bootstrap
    - web.redirect
