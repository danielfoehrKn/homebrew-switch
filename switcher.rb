class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.6.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.6.0/switcher_darwin_arm64"
      sha256 "974277bbd75e2aea0d791fa2f5290ae13f62f1c778b635eb672f454255046bf2"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.6.0/switcher_darwin_amd64"
      sha256 "91c840ff29447506d83c4d1f259d881bf1d6ee55ed3d8fed2bc5fa72fcc6e561"
    end
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.6.0/switcher_linux_amd64"
    sha256 "4c61f804c9a0f11d8ab9636680fb7053715e2d52f191e84e1d7f4e073585b4f0"
  end

  depends_on :arch => :x86_64

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
