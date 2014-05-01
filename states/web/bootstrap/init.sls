
include:
  - nginx
  - pkg.git

/srv/bootstrap/www:
  file.directory:
    - user: nginx
    - group: nginx
    - mode: 755
    - makedirs: True

https://github.com/pypa/pip.git:
  git.latest:
    - rev: master
    - target: /srv/bootstrap/pip
    - user: nginx
    - force: True
    - force_checkout: True

/srv/bootstrap/www/get-pip.py:
  file.symlink:
    - target: /srv/bootstraps/pip/contrib/get-pip.py

/etc/nginx/conf.d/bootstrap.pypa.io.conf:
  file.managed:
    - source: salt://web/bootstrap/config/nginx.conf.jinja
    - template: jinja
    - context:
      port: {{ pillar["web"]["bootstrap"]["port"] }}
