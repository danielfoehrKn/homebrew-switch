class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.4.6"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.4.6/switch.sh"
  sha256 "37484fb6ccd83ccf0e5b165a4ae04bfd107a510927e1c132310d01e2567fd78b"

  depends_on "danielfoehrkn/switch/switcher"
  depends_on :arch => :x86_64

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
