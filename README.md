<div align="center">

# asdf-racket [![Build](https://github.com/nandalopes/asdf-racket/actions/workflows/build.yml/badge.svg)](https://github.com/nandalopes/asdf-racket/actions/workflows/build.yml) [![Lint](https://github.com/nandalopes/asdf-racket/actions/workflows/lint.yml/badge.svg)](https://github.com/nandalopes/asdf-racket/actions/workflows/lint.yml)

[racket](https://github.com/nandalopes/racket) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

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
