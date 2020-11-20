<div align="center">

# asdf-hasura-cli ![Build](https://github.com/gurukulkarni/asdf-hasura-cli/workflows/Build/badge.svg) ![Lint](https://github.com/gurukulkarni/asdf-hasura-cli/workflows/Lint/badge.svg)

[hasura-cli](https://github.com/hasura/graphql-engine/tree/stable/cli) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add hasura-cli
# or
asdf plugin add https://github.com/gurukulkarni/asdf-hasura-cli.git
```

hasura-cli:

```shell
# Show all installable versions
asdf list-all hasura-cli

# Install specific version
asdf install hasura-cli latest

# Set a version globally (on your ~/.tool-versions file)
asdf global hasura-cli latest

# Now hasura-cli commands are available
version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/gurukulkarni/asdf-hasura-cli/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [GuruprasadKulkarni](https://github.com/gurukulkarni/)
