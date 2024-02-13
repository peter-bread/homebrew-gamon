# Homebrew Gamon

This is a Homebrew tap for installing Gamon, a GitHub Account Manager.

## Installation

To install the formula from this tap, run:

```shell
brew tap peter-bread/gamon
brew install gamon
```

## Usage

After installation, you can use Gamon with the `gam` command.

Before using Gamon, you must set the `GAM_REPO_ROOT_DIR` environment variable.

You can do this in your shell configuration file (e.g. `~/.bashrc`, `~/.zshrc`) like so:

```shell
export GAM_REPO_ROOT_DIR=/path/to/directory
```

Replace `/path/to/directory` with the actual value for `GAM_REPO_ROOT_DIR`.

## Updating

To update the formula from this tap, run:

```shell
brew update
brew upgrade gamon
```

## Uninstalling

To unistall the formula from this tap, run:

```shell
brew uninstall gamon
```

Optionally:

```shell
brew untap peter-bread/gamon
```
