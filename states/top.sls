base:
  "*":
    - base.autostate
    - base.sanity
    - base.sudo
    - users
    - monitoring

  "roles:salt":
    - match: grain
    - base.gitsync
