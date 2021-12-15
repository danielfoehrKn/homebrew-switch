class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.6.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.6.1/switcher_darwin_arm64"
      sha256 "3284bae635a123751e6b6a3655e2180b93ddeadb0ae222a6448fb6e916a44a48"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.6.1/switcher_darwin_amd64"
      sha256 "fc7251b5dacea822f942e424b06925f3def57060ba6627f8ed19ec79128568a3"
    end
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.6.1/switcher_linux_amd64"
    sha256 "17759a0e43d342716567f6ca602f3168efc8d1d036dbab79dfba2054d14b318c"
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
