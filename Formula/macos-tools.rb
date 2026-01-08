class MacosTools < Formula
  desc "Fast CLI tools for macOS Notes, Messages, Mail, and more"
  homepage "https://github.com/HamedMP/macos-tools"
  url "https://github.com/HamedMP/macos-tools/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "62af44a3bc02ddb2af3b60e35f0afda3adfe6b9a212cce97816fb7e6edfd197a"
  license "MIT"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/mac-notes"
    bin.install ".build/release/mac-messages"
    bin.install ".build/release/mac-mail"
    bin.install ".build/release/mac-contacts"
    bin.install ".build/release/mac-focus"
    bin.install ".build/release/mac-music"
  end

  def caveats
    <<~EOS
      For mac-messages and mac-mail to work, grant Full Disk Access to your terminal:
      System Settings > Privacy & Security > Full Disk Access > Add Terminal/iTerm
    EOS
  end

  test do
    assert_match "mac-notes", shell_output("#{bin}/mac-notes --help")
    assert_match "mac-messages", shell_output("#{bin}/mac-messages --help")
    assert_match "mac-mail", shell_output("#{bin}/mac-mail --help")
  end
end
