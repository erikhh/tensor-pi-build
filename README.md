# Build environment for meta-tensorflow layer

A Vagrant box with scripts to run a Yocto build for meta-tensorflow targeting
the Raspberry Pi compute module 3.

# Usage

You need the latest versions of [Vagrant](https://www.vagrantup.com) and
[VirtualBox](https://www.virtualbox.org) installed.

The Vagrantfile makes use of the `vagrant-disksize` and `vagrant-vbguest`
plugins. To install these first, run from the project root:

```
  vagrant plugin install vagrant-disksize vagrant-vbguest
```

Then bring the build guest up.

```
  vagrant up
```

And ssh into the guest machine and configure git there.

```
  vagrant ssh
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
```

Once on the inside you can start a build by running the build script.

```
  /vagrant/script/build.sh
```

This takes a few hours to complete.
