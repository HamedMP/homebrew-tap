class Idag < Formula
  desc "Modern CLI to query macOS Calendar from the terminal"
  homepage "https://github.com/HamedMP/idag"
  url "https://github.com/HamedMP/idag/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9e8990c31db3bda9cc38b8e0f4eb421a2a299adc1c3016f4be94bf33730b82aa"
  license "MIT"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/idag"
  end

  test do
    assert_match "idag", shell_output("#{bin}/idag --help")
  end
end
