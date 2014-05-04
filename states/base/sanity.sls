
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

ntpd:
  service:
    - running
    - enable: True
