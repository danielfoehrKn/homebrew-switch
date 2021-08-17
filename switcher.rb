class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.4.6"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.4.6/switcher_darwin_amd64"
    sha256 "69d1d331fc0bb9d4ddf378df0d357c3668b78cbd6b87435f17118837cc895252"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.4.6/switcher_linux_amd64"
    sha256 "62889b722128a405e1c399442611ae1d6740395d92c3903a95b60485f32b04f4"
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
