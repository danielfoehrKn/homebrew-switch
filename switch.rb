class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.3.0"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.3.0/switch.sh"
  sha256 "43dcab7171a2230abb215a196235654eec5664d9be80317ce5b7d2efe2323c86"

  depends_on "danielfoehrkn/switch/switcher"
  depends_on :arch => :x86_64

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
