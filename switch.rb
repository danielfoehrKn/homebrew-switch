class Switch < Formula
  desc "Context switching utility for kubectl"
  homepage "https://github.com/danielfoehrKn/kubectlSwitch"
  version "v0.0.3"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubectlSwitch/releases/download/0.0.3/switch.tar.gz"
    sha256 "a2d632d897afbc23f377faf4ccbce58a98dd0e57e602dd053818cd60c8a6b5c0"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubectlSwitch/releases/download/0.0.3/switch.tar.gz"
    sha256 "a2d632d897afbc23f377faf4ccbce58a98dd0e57e602dd053818cd60c8a6b5c0"
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