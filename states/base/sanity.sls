
niceties:
  pkg.installed:
    - pkgs:
      - htop
      - tmux
      - tree
      - bash-completion
      - vim

time-sync:
  pkg.installed:
    - pkgs:
      - ntp
      - ntpdate

ntp:
  service:
    - running
    - enable: True

wheel:
  group.present:
    - system: True

ubuntu:
  user.absent:
    - purge: True
