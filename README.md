## About

The bones utility is written in POSIX shell and can clone,
update, and install skeletons derived from a git repository.
It is inspired by a similar concept from UNIX operating systems &mdash;
where a skeleton directory can serve as the basis for a new user's
${HOME} directory.

Most commands in bones are delegated to the '\_bones' user
via the [doas(1)](https://man.openbsd.org/doas) utility.
The user running a command that is delegated to the
'\_bones' user must be a member of the '\_bones' group.
The /home/_bones directory is where skeletons are stored,
and only a superuser or a member of the '\_bones' group can
access them. Most of the setup is automated. See the
[Install](#install), [CLI](#cli) and [Concepts](#concepts)
sections for more details.

## CLI

#### Commands

* bones clone <br>
Clones into /home/_bones/.local/share/skeletons <br>
Requires membership of the '\_bones' group <br>

* bones pull <br>
Pulls updates <br>
Requires membership of the '\_bones' group <br>

* bones install <br>
Installs into a target directory

## Concepts

#### Terminology

In the context of the bones utility, a git repository is defined
as a collection of skeletons. Within the cloned git repository,
there can be one or more directories at the top-level.
Each directory is considered to be a skeleton in its own right,
and a cloned repository can contain many of them. **It is important
to realize that there can only be one git repository, and that
the git repository can have many skeletons.**

For example, one directory could be for unprivileged users and
another directory could be for a superuser. When used with the
"bones install" command, a directory from a skeleton can be
installed in a way similar to:
`bones install dirname /target`.

#### Conflicts

While not neccessarily a concept, it is common enough to be worth
a mention. Merge conflicts can occur when installing an updated
directory from a given skeleton. It is expected that the user
will manually resolve those conflicts as part of the install
process. The
[sdiff(1)](https://man.freebsd.org/cgi/man.cgi?sdiff)
utility is used to help the user resolve merge conflicts, and
it is recommended that the user is familiar with how to use it.
It is generally inuitive to use so the learning curve is not that
steep.

## Platforms

The following platforms have been tested and are known to work:

* OpenBSD
* FreeBSD (and its forks)
* Arch Linux

The following platforms remain untested but might work:

* MacOS
* NetBSD
* Linux distros other than Arch Linux

## Install

#### Clone

The first step is to clone the repository. <br>
Afterwards bones can be installed (and deinstalled) through make:

```sh
git clone https://github.com/0x1eef/bones
cd bones
doas -u root -- make install
doas -u root -- make deinstall
```

#### Configuration

After installation is complete the bones environment should be setup.
That involves the creation of the '\_bones' user and group, as well as
the creation of /home/\_bones. A user should also be added to the
'\_bones' group. The process is mostly automated:

```sh
doas -u root -- bones setup
doas -u root -- pw groupmod _bones -m <user> # FreeBSD
doas -u root -- usermod -G _bones <user>     # OpenBSD
doas -u root -- usermod -G _bones <user>     # Linux
doas -u root -- bones teardown               # Optional - reverse 'bones setup'
```

## Sources

* [github.com/@0x1eef](https://github.com/0x1eef/bones)
* [gitlab.com/@0x1eef](https://gitlab.com/0x1eef/bones)
* [bsd.cafe/@0x1eef](https://brew.bsd.cafe/0x1eef/bones)
* [hardenedbsd.org/@0x1eef](https://git.hardenedbsd.org/0x1eef/bones)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./share/bones/LICENSE)
