class Switch < Formula
  desc "Context switching utility for kubectl"
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "v0.1.0"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.1.0/switch.tar.gz"
    sha256 "e1d7cc518b2dd2e4dc27a92be27afa17c4df00afe0133a2d78ddb67c54987789"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.1.0/switch.tar.gz"
    sha256 "e1d7cc518b2dd2e4dc27a92be27afa17c4df00afe0133a2d78ddb67c54987789"
  end

  depends_on "danielfoehrkn/switch/switcher"
  depends_on :arch => :x86_64

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end