class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.8.1"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.8.1/switch.sh"
  sha256 "11d6f4b6d32632cf4080e67b72e99352cb50e8866543732f70998a20e0b77d47"

  depends_on "danielfoehrkn/switch/switcher"

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
