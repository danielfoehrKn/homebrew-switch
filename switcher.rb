class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubectlSwitch"
  version "v0.0.3"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubectlSwitch/releases/download/0.0.3/switcher.tar.gz"
    sha256 "a2fc16a8c45654c169f98b6900b66cbc387e5b4a21f939c687715a3a801581dd"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubectlSwitch/releases/download/0.0.3/switcher.tar.gz"
    sha256 "a2fc16a8c45654c169f98b6900b66cbc387e5b4a21f939c687715a3a801581dd"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "switcher"
  end

  test do
    system "#{bin}/switcher", "-h"
  end
end