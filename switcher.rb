class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.9.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.1/switcher_darwin_arm64"
      sha256 "8f95353d4eeca31e8460cb57d986f401cd1894109ce98c8f31ec9774ada5b48c"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.1/switcher_darwin_amd64"
      sha256 "a0776b4c0f1bd73d5214d7bd170949b62a197c49dabfb4cc5ecb4d6771da1803"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.1/switcher_linux_arm64"
      sha256 "01a723b21805ccbbeef86036cb364dcd89415d4b66bc071172446864aa7f1d41"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.1/switcher_linux_amd64"
      sha256 "c7df78eba2688b53ceb88c5245a199a669d9faaa26c71278c80a17d565d154c8"
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
