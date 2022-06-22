class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.7.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.7.1/switcher_darwin_arm64"
      sha256 "6ec813ad16b0a08726122492d32e34d5718be7823abf4fd7e33295bd45844930"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.7.1/switcher_darwin_amd64"
      sha256 "9b7abe62baf9b9925b39886848a162d41947e6f33a38a71f838379a0f25a8630"
    end
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.7.1/switcher_linux_amd64"
    sha256 "0e0260421065ff24f0257658e2367438bd2b8d687d2d3fd0500054af8d8bcc44"
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
