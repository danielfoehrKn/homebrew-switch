class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.6.2"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.6.2/switch.sh"
  sha256 "93c131f9b8103604bd840d62cd2c5086be63da5454e73789e49bddf9f238088f"

  depends_on "danielfoehrkn/switch/switcher"

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
