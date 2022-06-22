class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.7.1"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.7.1/switch.sh"
  sha256 "be0869f11b88f694a24030ebc0f494ec991e7046028b48e11a7d71ff66235ffe"

  depends_on "danielfoehrkn/switch/switcher"

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
