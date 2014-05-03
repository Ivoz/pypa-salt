
gcc:
  pkg.installed

python-devel:
  pkg.installed

python-pip:
  pkg.installed:
    - require:
      - pkg: gcc
      - pkg: python-devel
