class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.8.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.8.1/switcher_darwin_arm64"
      sha256 "93c98e2cb35703ac97e52dac2056a64c60ad57b64ff42e44c6adaf18e0c62b59"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.8.1/switcher_darwin_amd64"
      sha256 "8a3d5d9eca2c5a0aa706953b6d61acbad177eea55439009a644316672dfddaff"
    end
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.8.1/switcher_linux_amd64"
    sha256 "c943332f30e5106ece06bd06e6bda91b577961526a532b33c917b35af5acb887"
  end

  def install
      if OS.mac?
        if Hardware::CPU.arm?
          bin.install "switcher_darwin_arm64"
          mv bin/"switcher_darwin_arm64", bin/"switcher"
        else
          bin.install "switcher_darwin_amd64"
          mv bin/"switcher_darwin_amd64", bin/"switcher"
        end
      elsif OS.linux?
        bin.install "switcher_linux_amd64"
        mv bin/"switcher_linux_amd64", bin/"switcher"
      end
  end

  test do
    system "#{bin}/switcher", "-h"
  end
end
