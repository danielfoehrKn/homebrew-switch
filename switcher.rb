class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.8.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.8.0/switcher_darwin_arm64"
      sha256 "0954b6945cb904ca20732f5a2c9e5a25aee4265a77bf60262819a8e7e93477cb"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.8.0/switcher_darwin_amd64"
      sha256 "263bf1b4832ba16cdd249283d4fd3d99c491aa60f4546096f8a2b0fdfb881133"
    end
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.8.0/switcher_linux_amd64"
    sha256 "5f341531f557f85b58ac9a8aea7a4d02f694db213ac4b861391ae333bd3cbd5a"
  end

  def install
      if OS.mac?
        if Hardware::CPU.arm?
          bin.install "switcher_darwin_arm64"
          mv bin/"switcher_darwin_arm64", bin/"switcher"
        else
          bin.install "switcher_darwin_amd64"
          mv bin/"switcher_darwin_amd64", bin/"switcher"
        end
      elsif OS.linux?
        bin.install "switcher_linux_amd64"
        mv bin/"switcher_linux_amd64", bin/"switcher"
      end
  end

  test do
    system "#{bin}/switcher", "-h"
  end
end
