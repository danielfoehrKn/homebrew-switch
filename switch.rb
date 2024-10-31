class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.9.2"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.2/switch.sh"
  sha256 "661609a860ac75377423656c878e904d8b0ba4fd5613717e43d6499ad76e233b"

  depends_on "danielfoehrkn/switch/switcher"

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
