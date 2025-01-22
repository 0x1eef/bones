## About

The bones utility is written in POSIX shell and it can clone,
update, and install skeletons derived from a git repository.
The utility is inspired by a similar concept from UNIX operating
systems, where a skeleton directory can serve as the basis for
a user's `${HOME}` directory during the creation of a new user.

The bones utility delegates most of its commands to the `_bones`
user via the
[doas(1)](https://man.openbsd.org/doas)
utility. The user invoking a given command must be a member of
the `_bones` group in order to use most commands. The `/home/_bones`
directory is where skeletons are stored, and only a superuser
or a member of the `_bones` group can access them. Most of the 
setup is automated. See the [Install](#install), [CLI](#cli) 
and [Concepts](#concepts) sections for more details.

## CLI

#### Commands

* **bones clone** <br>
Clone into /home/_bones/.local/share/skeleton/. For example:

        bones clone https://github.com/0x1eef/skeleton

* **bones pull** <br>
Pull updates. For example:

        bones pull skeleton

* **bones install** <br>
Install into a target directory. The install command also takes
a number of options that determine the ownership of the files
and directories that are installed. For example:

        bones install skeleton:dirname /target -u <user> -g <group>

## Concepts

#### Terminology

In the terminology of the bones utility, "a skeleton" refers
to a cloned git repository. Within the cloned git repository,
there can be one or more directories at the top-level.
Each directory is considered to be a specific kind of skeleton,
and a cloned repository can contain many of them. For example,
one directory could be for unprivileged users and another directory
could be for a superuser. When used with the `bones install`
command, a directory from a skeleton can be installed in a way
similar to the following example:

    bones install skeleton:dirname <target>

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

## Install

#### Clone

The first step is to clone the repository. <br>
Afterwards bones can be installed (and deinstalled) through `make`:

    user@localhost$ git clone https://github.com/0x1eef/bones
    user@localhost$ cd bones
    root@localhost# make install
    root@localhost# make deinstall

#### Configuration

After installation is complete the bones environment should be setup.
That involves the creation of the `_bones` user and group, as well as
the creation of `/home/_bones`. A user should also be added to the
`_bones` group. The process is mostly automated:

    root@localhost# bones setup
    root@localhost# pw usermod <user> -g _bones # FreeBSD
    root@localhost# usermod -G _bones <user>    # OpenBSD
    root@localhost# bones teardown              # Optional - reverse 'bones setup'

## Sources

* [github.com/@0x1eef](https://github.com/0x1eef/bones)
* [gitlab.com/@0x1eef](https://gitlab.com/0x1eef/bones)
* [bsd.cafe/@0x1eef](https://brew.bsd.cafe/0x1eef/bones)
* [hardenedbsd.org/@0x1eef](https://git.hardenedbsd.org/0x1eef/bones)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./share/bones/LICENSE)
