
5m-interval-gitsync:
  cron.present:
    - identifier: gitsync
    - name: "cd /srv/pypa-salt && git fetch origin && git reset --hard origin/master -q >> /var/log/salt/cron-gitsync.log 2>&1"
    - minute: '*/5'
