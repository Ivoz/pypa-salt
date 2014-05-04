
unattended-upgrades:
  pkg.installed


/etc/apt/apt.conf.d/50unattended-upgrades:
  file.managed:
    - source: salt://unattended-upgrades/config/50unattended-upgrades
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: unattended-upgrades


/etc/apt/apt.conf.d/10periodic:
  file.managed:
    - source: salt://unattended-upgrades/config/10periodic
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: unattended-upgrades