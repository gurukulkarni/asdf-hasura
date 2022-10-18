<div align="center">

# asdf-hasura-cli ![Build](https://github.com/gurukulkarni/asdf-hasura/workflows/Build/badge.svg) ![Lint](https://github.com/gurukulkarni/asdf-hasura/workflows/Lint/badge.svg)

[hasura-cli](https://github.com/hasura/graphql-engine/tree/stable/cli) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [asdf-hasura-cli !Build ![Lint](https://github.com/gurukulkarni/asdf-hasura/workflows/Lint/badge.svg)](#asdf-hasura-cli--)
- [Contents](#contents)
- [Dependencies](#dependencies)
- [Install](#install)
- [Why](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`: generic POSIX utilities.

# Install

Plugin:

```shell
asdf plugin add hasura-cli https://github.com/gurukulkarni/asdf-hasura.git
# OR
asdf plugin add hasura-cli
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
hasura version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Why
The hasura Cli installation is just one of the things that we need but is harder to automate. Hence the Plugin!

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/gurukulkarni/hasura-cli/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [GuruprasadKulkarni](https://github.com/gurukulkarni/)
