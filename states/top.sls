base:
  "*":
    - base.autostate
    - base.sanity
    - base.sudo
    - users
    - monitoring
    - yum-cron

  "roles:salt":
    - match: grain
    - base.gitsync
