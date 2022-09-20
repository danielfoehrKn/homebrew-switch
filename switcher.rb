class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.7.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.7.2/switcher_darwin_arm64"
      sha256 "94786f475a5b8ee505bc4c006f331c109133abff0d3eec9f729abd350827d4a8"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.7.2/switcher_darwin_amd64"
      sha256 "5e1c5ddb21b2ca417ad8b37883a296564c631fa13c9c28d7123638b45eb586e3"
    end
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.7.2/switcher_linux_amd64"
    sha256 "24e8909aa5bd7ea8b1f486b46d1506ae6fcbcefe16d89c28884e9d217d8ada70"
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
