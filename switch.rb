class Switch < Formula
  desc "Context switching utility for kubectl"
  homepage "https://github.com/danielfoehrKn/kubectlSwitch"
  version "v0.0.1"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubectlSwitch/releases/download/0.0.1/switch.tar.gz"
    sha256 "0b02ced79f210ba5407dd184abdd5238134d6c186f526b223ab74a53e183e576"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubectlSwitch/releases/download/0.0.1/switch.tar.gz"
    sha256 "0b02ced79f210ba5407dd184abdd5238134d6c186f526b223ab74a53e183e576"
  end

  depends_on "danielfoehrkn/switch/switcher"
  depends_on :arch => :x86_64

  def install
    bin.install "switch.sh" => "switch"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end