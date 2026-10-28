cask "flutter-vita" do
  version "3.47.7-vita.1.0.5"
  sha256 "650df56118cc46418ed26465cc6b128af4405254d35111b50081f1f3423ac49c"

  url "https://github.com/flutter-vita/flutter-vita/releases/download/#{version}/flutter-vita-#{version}.tar.gz"
  name "flutter-vita"
  desc "Build, install and run Flutter apps on the PlayStation Vita"
  homepage "https://github.com/flutter-vita/flutter-vita"

  depends_on arch: :arm64
  depends_on formula: "cmake"

  # The whole tree, submodules included: the launcher and every build run the
  # scripts in tools/. Without .git the tool writes into ~/.flutter-vita.
  binary "flutter-vita/cli/flutter-vita"

  caveats <<~EOS
    The first command downloads Flutter #{version.split("-").first} for the tool's own use
    (2.1 GB) into ~/.flutter-vita. It does not touch your own Flutter.

    The first `flutter-vita doctor` or `flutter-vita build` also installs
    VitaSDK (about 100 MB) into ~/.flutter-vita, unless it finds one in
    VITASDK, ~/vitasdk or /usr/local/vitasdk.
  EOS
end
