class MacosTools < Formula
  desc "Fast CLI tools for macOS Calendar, Notes, Messages, Mail, Canvas, and more"
  homepage "https://github.com/HamedMP/macos-tools"
  url "https://github.com/HamedMP/macos-tools/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "52e1732cb7f037d9a0890323f16cd7bcbb3775314ceeef022fd65a7e6435e771"
  license "MIT"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/mac-calendar"
    bin.install ".build/release/mac-notes"
    bin.install ".build/release/mac-messages"
    bin.install ".build/release/mac-mail"
    bin.install ".build/release/mac-contacts"
    bin.install ".build/release/mac-focus"
    bin.install ".build/release/mac-music"
    bin.install ".build/release/mac-canvas"
  end

  def caveats
    <<~EOS
      For mac-messages and mac-mail to work, grant Full Disk Access to your terminal:
      System Settings > Privacy & Security > Full Disk Access > Add Terminal/iTerm

      For mac-calendar to work, grant Calendar access when prompted.
    EOS
  end

  test do
    assert_match "mac-calendar", shell_output("#{bin}/mac-calendar --help")
    assert_match "mac-notes", shell_output("#{bin}/mac-notes --help")
    assert_match "mac-messages", shell_output("#{bin}/mac-messages --help")
    assert_match "mac-mail", shell_output("#{bin}/mac-mail --help")
    assert_match "mac-canvas", shell_output("#{bin}/mac-canvas --help")
  end
end
