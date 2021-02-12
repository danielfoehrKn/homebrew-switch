class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "v0.2.0"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.2.0/switcher_darwin_amd64.tar.gz"
    sha256 "a85cdd9ac8e7ea4e1d1edbeaeb981f25580caf07897d9667f2dde59dce69ce8c"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.2.0/switcher_linux_amd64.tar.gz"
    sha256 "35c052f0561793a4111525fc40bf50ec029a717337811b905a6db26ad1c06972"
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