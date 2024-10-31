class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.9.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.2/switcher_darwin_arm64"
      sha256 "1054eafc531347e1d6bfea3e27320513b2d2d13149918223f7075cbad77cab49"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.2/switcher_darwin_amd64"
      sha256 "3c78a79e4652ad9fab715e6be878dfc418100d4d97731c717193ef263954c96b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.2/switcher_linux_arm64"
      sha256 "0781897e68403c4a70508cf187c685f52f54ec86aae0fff366fd3e7e1946089d"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.2/switcher_linux_amd64"
      sha256 "1034ff417568454c80da9de05a24f70905fccc234eb63adb7ed7b17da57e92de"
    end
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
        if Hardware::CPU.arm?
          bin.install "switcher_linux_arm64"
          mv bin/"switcher_linux_arm64", bin/"switcher"
        else
          bin.install "switcher_linux_amd64"
          mv bin/"switcher_linux_amd64", bin/"switcher"
        end
      end
  end

  test do
    system "#{bin}/switcher", "-h"
  end
end
