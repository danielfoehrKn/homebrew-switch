class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.7.0"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.7.0/switch.sh"
  sha256 "20f673e399984deee681fa4bb3f1991ee5f3b710ce8a4bc8dc2fc7414743d04a"

  depends_on "danielfoehrkn/switch/switcher"
  depends_on :arch => :x86_64

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
