
niceties:
  pkg.installed:
    - pkgs:
      - htop
      - tmux
      - tree
      - bash-completion
      - vim
      - curl

time-sync:
  pkg.installed:
    - pkgs:
      - ntp
      - ntpdate

ntp:
  service:
    - running
    - enable: True

ubuntu:
  user.absent:
    - purge: True
