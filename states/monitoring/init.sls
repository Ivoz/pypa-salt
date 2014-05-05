
include:
  - pkg.apt

/etc/apt/keys/APT-GPG-KEY-RACKSPACE-MONITORING:
  file.managed:
    - source: salt://monitoring/APT-GPG-KEY-RACKSPACE-MONITORING
    - user: root
    - group: root
    - mode: 444

rackspace-monitoring-package:
  pkgrepo.managed:
    - name: deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-14.04-x86_64 cloudmonitoring main
    - key_url: file:///etc/apt/keys/APT-GPG-KEY-RACKSPACE-MONITORING
    - require:
      - file: /etc/apt/keys/APT-GPG-KEY-RACKSPACE-MONITORING
      - pkg: python-apt

  pkg.latest:
    - name: rackspace-monitoring-agent
    - require:
      - pkgrepo: rackspace-monitoring-package

rackspace-monitoring-configure:
  cmd.run:
    - name: "rackspace-monitoring-agent --username '{{ pillar['rackspace']['username'] }}' --apikey '{{ pillar['rackspace']['apikey'] }}' --setup"
    - unless: ls /etc/rackspace-monitoring-agent.cfg
    - require:
      - pkg: rackspace-monitoring-package

rackspace-monitoring-agent:
  service:
    - running
    - enable: True
    - reload: True
    - require:
      - cmd: rackspace-monitoring-configure
