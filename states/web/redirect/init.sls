
/etc/nginx/conf.d/bootstrap.pypa.io.conf:
  file.managed:
    - source: salt://web/redirect/config/nginx.conf.jinja
    - template: jinja
    - context:
      redirects: {{ pillar["web"]["redirect"] }}
