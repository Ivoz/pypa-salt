
python-devel:
  pkg.installed

python-pip:
  pkg.installed:
    - require:
      - pkg: python-devel
