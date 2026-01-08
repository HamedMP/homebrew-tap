class MacosTools < Formula
  desc "CLI tools for macOS - reminders, notes, contacts, music, focus"
  homepage "https://github.com/HamedMP/macos-tools"
  url "https://github.com/HamedMP/macos-tools/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "553932c1610106815983221df94cf379f8241a3fd8890a15d5c4a8e26fdcb51b"
  license "MIT"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/mac-reminders"
    bin.install ".build/release/mac-notes"
    bin.install ".build/release/mac-contacts"
    bin.install ".build/release/mac-focus"
    bin.install ".build/release/mac-music"
  end

  test do
    assert_match "mac-reminders", shell_output("#{bin}/mac-reminders --help")
  end
end
