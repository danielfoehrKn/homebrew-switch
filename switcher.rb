class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.4.5"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.4.5/switcher_darwin_amd64"
    sha256 "c503537c7d574cc900f7522fccf413e5059e6c2a99cac8dc72372adb331bb83d"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.4.5/switcher_linux_amd64"
    sha256 "6238d7f048eab9c35bb17556791053286cf9c84975bc4a1140f7b690168d1436"
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
