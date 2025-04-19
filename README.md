## About

The bones utility is written in POSIX shell and can clone,
update, and install skeletons derived from a git repository.
It is inspired by a similar concept from UNIX operating systems &mdash;
where a skeleton directory can serve as the basis for a new user's
`${HOME}` directory. 

## Roles

#### User

The following commands are restricted to members of the `_bones` group. <br>
The commands are delegated to the `_bones` user via the
[doas(1)](https://man.openbsd.org/doas) command:

* bones clone <br>
Clones into /home/_bones/.local/share/skeletons <br>

* bones pull <br>
Pulls updates <br>

* bones rm <br>
Removes the skeleton repository <br>

* bones install <br>
Installs into a target directory <br>

## Configuration

#### Superuser

After installation is complete the bones environment should be setup. <br>

That includes the creation of the `_bones` user and group, as well as
the creation of `/home/_bones`. A user should also be added to the
`_bones` group. The process is mostly automated, and the following
commands should be run as asuperuser:

* bones setup<br>
  Creates the `_bones` user and group <br>

* bones teardown <br>
  Tears down the `_bones` user and group <br>

* pw groupmod _bones -m `<user>` <br>
   Add a user to the `_bones` group. <br>

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

## Sources

* [github.com/@0x1eef](https://github.com/0x1eef/bones)
* [gitlab.com/@0x1eef](https://gitlab.com/0x1eef/bones)
* [bsd.cafe/@0x1eef](https://brew.bsd.cafe/0x1eef/bones)
* [hardenedbsd.org/@0x1eef](https://git.hardenedbsd.org/0x1eef/bones)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./share/bones/LICENSE)
