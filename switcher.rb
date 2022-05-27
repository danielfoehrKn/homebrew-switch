class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.7.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.7.0/switcher_darwin_arm64"
      sha256 "ee066ca12669ccbc5579cf3c915a6917abf22f83e502a36179a59576dad71fa2"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.7.0/switcher_darwin_amd64"
      sha256 "e351540526ace5ab5534b120e681e277dff7de80831e161680bc7cbb7686c32f"
    end
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.7.0/switcher_linux_amd64"
    sha256 "8508523be3a183f97b5f733f3cd9b00dd6ad29e17dcd9dbf291b2a91d0e385b9"
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
