class Switcher < Formula
  desc "Providing the executable for the 'switch' script"
  homepage "https://github.com/danielfoehrKn/kubectlSwitch"
  version "v0.0.1"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubectlSwitch/releases/download/0.0.1/switcher.tar.gz"
    sha256 "327e964a2ea49ea7e00b5bac1d05ec557c921213eba1a56cadf79116a67cce10"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubectlSwitch/releases/download/0.0.1/switcher.tar.gz"
    sha256 "327e964a2ea49ea7e00b5bac1d05ec557c921213eba1a56cadf79116a67cce10"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "switcher"
  end

  test do
    system "#{bin}/switcher", "-h"
  end
end