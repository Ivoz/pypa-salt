
/etc/pki/rpm-gpg/RPM-GPG-KEY-RACKSPACE-MONITORING:
  file.managed:
    - source: salt://monitoring/RPM-GPG-KEY-RACKSPACE-MONITORING
    - user: root
    - group: root
    - mode: 444

rackspace-package:
  pkgrepo.managed:
    - humanname: Rackspace Monitoring
    - baseurl: http://stable.packages.cloudmonitoring.rackspace.com/centos-6-x86_64
    - gpgcheck: 1
    - gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-RACKSPACE-MONITORING
    - require:
      - file: /etc/pki/rpm-gpg/RPM-GPG-KEY-RACKSPACE-MONITORING

  pkg.latest:
    - require:
      - pkgrepo: monitoring-el6

rackspace-configure:
  cmd.run:
    - name: "rackspace-monitoring-agent --username '{{ pillar['rackspace']['username'] }}' --apikey '{{ pillar['rackspace']['apikey'] }}' --setup"
    - unless: ls /etc/rackspace-monitoring-agent.cfg

rackspace-monitoring-agent:
  service:
    - running
    - enable: True
    - reload: True
