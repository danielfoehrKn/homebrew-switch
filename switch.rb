class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.5.0"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.5.0/switch.sh"
  sha256 "3a629c2d1065adccbf636eb1c9f86884bad336d4d7ad06424801f461c16c6c4e"

  depends_on "danielfoehrkn/switch/switcher"
  depends_on :arch => :x86_64

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
