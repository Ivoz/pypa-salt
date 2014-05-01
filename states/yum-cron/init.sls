
yum-cron-package:
  pkg.installed:
    - name: yum-cron

yum-cron:
  service:
    - running
    - enable: True
    - reload: True
    - watch:
      - pkg: yum-cron-package
