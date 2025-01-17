## About

bones is a utility written in POSIX shell that can clone,
update, and install skeletons derived from a git repository.
The utility is inspired by a similar concept from UNIX operating
systems, where a skeleton directory can serve as the basis for
a user's `${HOME}` directory during the creation of a new user.

## Concepts

#### Terminology

In the terminology of the bones utility, "a skeleton" refers
to a git repository. Within the git repository, there can be one
or more directories at the top-level. Each directory is considered
to be a "bone". When used with the `bones install` command,
a bone from a skeleton can be installed in a way similar to
the following example. Keep in mind that these concepts are
important to understand when planning to use bones:

    user@localhost$ skeleton install <skeleton>/<bone> <target>

## CLI

#### Commands

* **bones clone** <br>
Clone into ${HOME}/.local/share/bones/

* **bones pull** <br>
Pull updates

* **bones install** <br>
Install into a target directory

## Install

TODO

## Sources

* [github.com/@0x1eef](https://github.com/0x1eef/bones)
* [gitlab.com/@0x1eef](https://gitlab.com/0x1eef/bones)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./LICENSE)
