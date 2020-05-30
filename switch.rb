class Switch < Formula
  desc "Context switching utility for kubectl"
  homepage "https://github.com/danielfoehrKn/kubectlSwitch"
  version "v0.0.2"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubectlSwitch/releases/download/0.0.2/switch.tar.gz"
    sha256 "1c0d31b922ed31f303493617d69fa45e67756a193aa88c69f2c478ce12c285d4"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubectlSwitch/releases/download/0.0.2/switch.tar.gz"
    sha256 "1c0d31b922ed31f303493617d69fa45e67756a193aa88c69f2c478ce12c285d4"
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