cask "flutter-vita" do
  version "3.47.7-vita.1.0.2"
  sha256 "8b6dc9e1b76b0963042275b74eea8ae578799a57d60a9a3d9695b3b6b4a8abc0"

  url "https://github.com/flutter-vita/flutter-vita/releases/download/#{version}/flutter-vita-#{version}.tar.gz"
  name "flutter-vita"
  desc "Build, install and run Flutter apps on the PlayStation Vita"
  homepage "https://github.com/flutter-vita/flutter-vita"

  depends_on arch: :arm64
  depends_on formula: "cmake"
  depends_on formula: "python@3.15"

  # The whole tree, submodules included: the launcher and every build run the
  # scripts in tools/. Without .git the tool writes into ~/.flutter-vita.
  binary "flutter-vita/cli/flutter-vita"

  caveats <<~EOS
    flutter-vita also needs VitaSDK, which Homebrew does not have.
    Install it from https://vitasdk.org, then set VITASDK and put
    $VITASDK/bin on your PATH. `flutter-vita doctor` checks the setup.

    The first command downloads Flutter #{version.split("-").first} for the tool's own use
    (2.1 GB) into ~/.flutter-vita. It does not touch your own Flutter.
  EOS
end
