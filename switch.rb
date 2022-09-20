class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.7.2"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.7.2/switch.sh"
  sha256 "9c01adbe98329cc43bf6e1832e6d98de934e368ca170ba8260ff710c826d4116"

  depends_on "danielfoehrkn/switch/switcher"

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
