class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.5.0"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.5.0/switcher_darwin_amd64"
    sha256 "c17aa2d0ad5d09a4a38450d26502a5b1a01bdc2bfe661fa9b8c70789e955d704"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.5.0/switcher_linux_amd64"
    sha256 "dc0c487b270755dc7fddf1b2dcceb54642067da42f4b0f25022d3ce1318b26b8"
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
