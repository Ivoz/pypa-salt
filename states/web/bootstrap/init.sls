
include:
  - nginx
  - git

/srv/bootstraps/www:
  file.directory:
    - user: nginx
    - group: nginx
    - mode: 755
    - makedirs: True

https://github.com/pypa/pip.git:
  git.latest:
    - rev: master
    - target: /srv/bootstraps/pip
    - user: nginx
    - force: True
    - force_checkout: True

/srv/bootstraps/www/get-pip.py:
  file.symlink:
    - target: /srv/bootstraps/pip/contrib/get-pip.py
