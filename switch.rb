class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.4.3"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.4.3/switch.sh"
  sha256 "15fcbfce6dcf408eb231950c9672a798c2759e3235ff8835801eca2a64b57d3d"

  depends_on "danielfoehrkn/switch/switcher"
  depends_on :arch => :x86_64

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
