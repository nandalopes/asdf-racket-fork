<div align="center">

# asdf-racket [![Build](https://github.com/nandalopes/asdf-racket/actions/workflows/build.yml/badge.svg)](https://github.com/nandalopes/asdf-racket/actions/workflows/build.yml) [![Lint](https://github.com/nandalopes/asdf-racket/actions/workflows/lint.yml/badge.svg)](https://github.com/nandalopes/asdf-racket/actions/workflows/lint.yml) <!-- omit from toc -->

[racket](https://racket-lang.org/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents <!-- omit from toc -->

- [Dependencies](#dependencies)
  - [Racket dependecy details](#racket-dependecy-details)
- [Configuration](#configuration)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.

## Racket dependecy details

Mostly, you need a C compiler and `make`.

For detailed instructions, see [README.txt in src folder](https://github.com/racket/racket/blob/f81671d6c9776ec970d5af6e39c21d8672e5652f/racket/src/README.txt#L73).

# Configuration

- `ASDF_RACKET_MINIMAL`: set this environment variable in your shell to install the minimal version of Racket language.
- `ASDF_RACKET_CONFIG_FLAGS`: set this environment variable in your shell to pass configure flags in installation.

# Install

Plugin:

```shell
asdf plugin add racket
# or
asdf plugin add racket https://github.com/nandalopes/asdf-racket.git
```

racket:

```shell
# Show all installable versions
asdf list-all racket

# Install specific version
asdf install racket latest

# Set a version globally (on your ~/.tool-versions file)
asdf global racket latest

# Now racket commands are available
racket --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/nandalopes/asdf-racket/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Nanda Lopes](https://github.com/nandalopes/)
