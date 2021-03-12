class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.4.1"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.4.1/switch.sh"
  sha256 "ddbd91861f7f732cb7373d0296afa6849a74e35db7ef7fe7fe634966dd3c52de"

  depends_on "danielfoehrkn/switch/switcher"
  depends_on :arch => :x86_64

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
