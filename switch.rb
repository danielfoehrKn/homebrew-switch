class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "4.0.2"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/4.0.2/switch.sh"
  sha256 "bf29536e767212981f3475c254af18a09cf3e9e66a62356838da9eb4d7f2c2e9"

  depends_on "danielfoehrkn/switch/switcher"
  depends_on :arch => :x86_64

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
