base:
  "*":
    - users

  "roles:salt":
    - match: grain
    - firewall.salt
