
5m-interval-gitsync:
  cron.present:
    - name: "cd /srv/pypa-salt && git pull origin master >> /var/log/salt/cron-gitsync.log 2>&1"
    - minute: '*/5'
