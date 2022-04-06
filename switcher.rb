class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.6.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.6.2/switcher_darwin_arm64"
      sha256 "9f27d6769528e60d13ad6ccd6e09f471dabd808e9f0c24eda9e3452f85dfb4a2"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.6.2/switcher_darwin_amd64"
      sha256 "7ed084c6d08f76ecfd752c2969fbc219eb7dfeeb0ab80792336ac8513ec1b49c"
    end
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.6.2/switcher_linux_amd64"
    sha256 "c93273e3ec228e65e68a669d48ce142acd5343c326ae519a7f3e2e124dc8aecb"
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
