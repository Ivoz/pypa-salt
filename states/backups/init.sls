
include:
  - pkg.apt

/etc/apt/keys/APT-GPG-KEY-RACKSPACE-BACKUP:
  file.managed:
    - source: salt://monitoring/APT-GPG-KEY-RACKSPACE-BACKUP
    - user: root
    - group: root
    - mode: 444

rackspace-backup-package:
  pkgrepo.managed:
    - name: "deb [arch=amd64] http://agentrepo.drivesrvr.com/debian/ serveragent main"
    - key_url: file:///etc/apt/keys/APT-GPG-KEY-RACKSPACE-BACKUP
    - require:
      - file: /etc/apt/keys/APT-GPG-KEY-RACKSPACE-BACKUP
      - pkg: python-apt

  pkg.latest:
    - name: driveclient
    - require:
      - pkgrepo: rackspace-backup-package

rackspace-backup-configure:
  cmd.run:
    - name: "driveclient --configure --username '{{ pillar['rackspace']['username'] }}' --apikey '{{ pillar['rackspace']['apikey'] }}' --configure"
    - unless: ls /etc/driveclient/bootstrap.json
    - require:
      - pkg: rackspace-backup-package

driveclient:
  service:
    - running
    - enable: True
    - reload: True
    - require:
      - cmd: rackspace-backup-configure
