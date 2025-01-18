## About

bones is a utility written in POSIX shell that can clone,
update, and install skeletons derived from a git repository.
The utility is inspired by a similar concept from UNIX operating
systems, where a skeleton directory can serve as the basis for
a user's `${HOME}` directory during the creation of a new user.

bones delegates certain commands to the `_bones` user via the
[doas(1)](https://man.openbsd.org/doas)
utility. The user invoking a given command must be a member of
the `_bones` group in order to use certain commands. The `/home/_bones`
directory is where skeletons are stored, and only a superuser
or a member of the `_bones` group can access that directory.
See the [Install](#install) and [CLI](#cli) sections for more
details.

## CLI

#### Commands

* **bones clone** <br>
Clone into /home/_bones/.local/share/skeleton/. For example:

        user@localhost$ bones clone https://github.com/0x1eef/skeleton

* **bones pull** <br>
Pull updates. For example:

        user@localhost$ bones pull skeleton

* **bones install** <br>
Install into a target directory. The install command also takes
a number of options that determine the ownership of the files
and directories that are installed. For example:

        user@localhost$ bones install skeleton:bone /target -u <user> -g <group>

## Concepts

#### Terminology

In the terminology of the bones utility, "a skeleton" refers
to a cloned git repository. Within the cloned git repository,
there can be one or more directories at the top-level.
Each directory is considered to be a "bone". When used with
the `bones install` command, a bone from a skeleton can be
installed in a way similar to the following example.
Keep in mind that these concepts are important to understand
when planning to use bones:

    user@localhost$ bones install skeleton:bone <target>

#### Conflicts

While not neccessarily a concept, it is common enough to be worth
a mention. Merge conflicts can occur when installing an updated
version of a bone from a skeleton. It is expected that the user
will manually resolve those conflicts as part of the install
process. The
[sdiff(1)](https://man.freebsd.org/cgi/man.cgi?sdiff)
utility is used to help the user resolve merge conflicts, and
it is recommended that the user is familiar with how to use it.
It is generally inuitive to use so the learning curve is not that
steep.

## Install

bones can be installed directly via git.

    user@localhost$ git clone https://github.com/0x1eef/bones
    user@localhost$ cd bones
    root@localhost# make install
    root@localhost# make deinstall

## Sources

* [github.com/@0x1eef](https://github.com/0x1eef/bones)
* [gitlab.com/@0x1eef](https://gitlab.com/0x1eef/bones)
* [bsd.cafe/@0x1eef](https://brew.bsd.cafe/0x1eef/bones)
* [hardenedbsd.org/@0x1eef](https://git.hardenedbsd.org/0x1eef/bones)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./share/bones/LICENSE)
