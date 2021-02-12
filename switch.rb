class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "v0.2.0"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.2.0/switch.tar.gz"
    sha256 "202f6657177947487939c634ef260a38c3bac50b442c1d3af42597ad0d463986"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.2.0/switch.tar.gz"
    sha256 "202f6657177947487939c634ef260a38c3bac50b442c1d3af42597ad0d463986"
  end

  depends_on "danielfoehrkn/switch/switcher"
  depends_on :arch => :x86_64

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end