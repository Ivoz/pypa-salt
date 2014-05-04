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
# apt-get install salt-master
# wget https://github.com/pypa/pypa-salt/raw/master/bootstrap/configs/master.conf -O /etc/salt/master.d/local.conf
# service salt-master restart
```

Future
======

Once SaltStack Helium has been released and is in PPA we can remove the git
syncing stuff in ``base.gitsync``.
