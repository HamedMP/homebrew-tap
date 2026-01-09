class MacosTools < Formula
  desc "Fast CLI tools for macOS Calendar, Notes, Messages, Mail, Canvas, and more"
  homepage "https://github.com/HamedMP/macos-tools"
  url "https://github.com/HamedMP/macos-tools/releases/download/v1.4.3/macos-tools-1.4.3-arm64.zip"
  sha256 "bd4f9f1baa825588feff6cd961ade118e28a6908037dceac27ea90158f2bc571"
  license "MIT"
  version "1.4.3"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "mac-calendar"
    bin.install "mac-notes"
    bin.install "mac-messages"
    bin.install "mac-mail"
    bin.install "mac-contacts"
    bin.install "mac-focus"
    bin.install "mac-music"
    bin.install "mac-canvas"
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
