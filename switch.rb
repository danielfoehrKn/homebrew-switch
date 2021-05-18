class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.4.4"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.4.4/switch.sh"
  sha256 "3039261e032a7330cdcd522e1a415c9c36276a64ad1efd8a798ef30efed42aab"

  depends_on "danielfoehrkn/switch/switcher"
  depends_on :arch => :x86_64

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
