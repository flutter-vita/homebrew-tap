# Homebrew tap for flutter-vita

This repository holds the Homebrew cask for
[flutter-vita](https://github.com/flutter-vita/flutter-vita), the tool that
builds Flutter apps for the PS Vita.

## Install

```sh
brew install --cask flutter-vita/tap/flutter-vita
```

The cask works from release `3.47.7-vita.1.0.2`. It installs on a Mac with
Apple silicon, and it installs `cmake` and Python if you do not have them.

You must also install VitaSDK, because Homebrew does not have it. Install it
from [vitasdk.org](https://vitasdk.org), set `VITASDK`, and put
`$VITASDK/bin` on your `PATH`. Then check the setup:

```sh
flutter-vita doctor
```

The first command downloads Flutter 3.47.7 for the tool's own use (2.1 GB)
into `~/.flutter-vita`. It does not change the Flutter that you use for other
projects. Then install the Bridge on the console:
[Console setup](https://github.com/flutter-vita/flutter-vita/blob/master/docs/configure-console.md).

## Update and remove

```sh
brew upgrade --cask flutter-vita
brew uninstall --cask flutter-vita
```

The tool keeps the engine and the Flutter SDK in `~/.flutter-vita`. Remove
that folder too if you do not use flutter-vita again.

## How the cask changes

`tools/publish-release.sh` in flutter-vita updates `Casks/flutter-vita.rb`
after each tool release that is not a pre-release. It sets the version and the
sha256 of `flutter-vita-<tag>.tar.gz`. Do not edit the cask by hand for a
release. [How we release](https://github.com/flutter-vita/flutter-vita/blob/master/docs/release.md).

## Licence

zlib, see [LICENSE](LICENSE).
