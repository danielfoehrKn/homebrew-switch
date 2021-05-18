class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.4.4"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.4.4/switcher_darwin_amd64"
    sha256 "65d301b0493e2d035e144023e3ebae7ab11334b83949b1b99c4a842e71ab69e8"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.4.4/switcher_linux_amd64"
    sha256 "74ecb8ee668cadfcef871928c53a31a834369cbb6bb21f4be9e88a0a0006dd7d"
  end

  depends_on :arch => :x86_64

  def install
      if OS.mac?
        bin.install "switcher_darwin_amd64"
        mv bin/"switcher_darwin_amd64", bin/"switcher"
      elsif OS.linux?
        bin.install "switcher_linux_amd64"
        mv bin/"switcher_linux_amd64", bin/"switcher"
      end
  end

  test do
    system "#{bin}/switcher", "-h"
  end
end
