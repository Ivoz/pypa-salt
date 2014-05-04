
include:
  - nginx
  - pkg.git
  - pkg.hg

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

https://bitbucket.org/pypa/setuptools:
    hg.latest:
      - rev: bootstrap
      - target: /srv/bootstrap/setuptools
      - user: nginx
      - clean: True
      - force: True

/srv/bootstrap/www/get-pip.py:
  file.symlink:
    - target: /srv/bootstrap/pip/contrib/get-pip.py

/srv/bootstrap/www/ez_setup.py:
  file.symlink:
    - target: /srv/bootstrap/setuptools/ez_setup.py

/etc/nginx/conf.d/bootstrap.pypa.io.conf:
  file.managed:
    - source: salt://web/bootstrap/config/nginx.conf.jinja
    - template: jinja
    - context:
      port: {{ pillar["web"]["bootstrap"]["port"] }}
      fastly_token: {{ pillar["fastly"]["header_token"] }}
    - require:
      - pkg: nginx
