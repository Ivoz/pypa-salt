PyPA Salt
=========

Bootstrap a Minion
==================

First you need to install the salt minion, you can do that with:

```console
# add-apt-repository ppa:saltstack/salt
# apt-get update
# apt-get install salt-minion
# wget https://github.com/pypa/pypa-salt/raw/master/bootstrap/configs/minion.conf -O /etc/salt/minion.d/local.conf
# service salt-minion restart
```

Then you need to edit ``/etc/salt/minion.d/local.conf`` to include the correct
roles for the minion you are bootstrapping.

Then you need to setup salt to connect to the master, you can do that with:

```console
# salt-call state.highstate  # Will raise an error
```

Then go onto the salt master and run:

```console
# salt-key -A
```

Finally you can come back to the new minion and run:

```console
# salt-call state.highstate
```


Bootstrap a Master
==================

```console
# add-apt-repository ppa:saltstack/salt
# apt-get update
# apt-get install salt-master acl
# wget https://github.com/pypa/pypa-salt/raw/master/bootstrap/configs/master.conf -O /etc/salt/master.d/local.conf
# mkdir -p /srv/git/pypa-secrets.git
# setfacl -R -m g:wheel:rwX /srv/git
# find /srv/git -type d | xargs setfacl -R -m d:g:wheel:rwX
# service salt-master restart
```


Secret Pillar Data
==================

Secret pillar data is stored in a separate git repository. That can be cloned
by running ``git clone salt.pypa.io:/srv/git/pypa-secrets.git``. Edit the files
in that directory, commit them, and then push them back to update the secret
pillar data.

Accessing this data will require a SSH account in the ``wheel`` group.


Future
======

Once SaltStack Helium has been released and is in PPA we can remove the git
syncing stuff in ``base.gitsync``.
