
include:
  - pkg.pip

mercurial-rpm:
  pkg.purged:
    - name: mercurial

mercurial:
  pip.installed:
    - require:
      - pkg: python-pip
      - pkg.purged: mercurial
