class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubectlSwitch"
  version "v0.0.1"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubectlSwitch/releases/download/0.0.1/switcher.tar.gz"
    sha256 "f7ae5e8cf46d802cd3561cffb35c55e1ff66bb6b6fe4630ea651fa23f74d6b6e"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubectlSwitch/releases/download/0.0.2/switcher.tar.gz"
    sha256 "f7ae5e8cf46d802cd3561cffb35c55e1ff66bb6b6fe4630ea651fa23f74d6b6e"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "switcher"
  end

  test do
    system "#{bin}/switcher", "-h"
  end
end