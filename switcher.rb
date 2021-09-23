class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.4.7"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.4.7/switcher_darwin_amd64"
    sha256 "7e3bc59f4568844169d176413be1cbf151a56bff3653dd564205d82b8fbd7a97"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.4.7/switcher_linux_amd64"
    sha256 "a44f466dd9105f6366cd295eced390f5638b36656ccad51f2d7db9fa9133e3c0"
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
