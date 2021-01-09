class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "v0.1.0"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.1.0/switcher_darwin_amd64.tar.gz"
    sha256 "acf327c7795b94c96e13736f9953f3662a040d093d397c34cedcad58565b4665"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.1.0/switcher_linux_amd64.tar.gz"
    sha256 "4a5bd78119dbcda9a79f4bebd391fbf19cb6fdb9f147409dfd1de7c8dc329088"
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