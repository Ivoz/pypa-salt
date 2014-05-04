
5m-interval-gitsync:
  cron.present:
    - name: "cd /srv/pypa-salt && git fetch origin && git reset --hard origin/ubuntu -q >> /var/log/salt/cron-gitsync.log 2>&1"
    - minute: '*/5'
