class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.9.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.0/switcher_darwin_arm64"
      sha256 "9bdc381c4224dbd667c3d4296ede2e22ae9e1f4ecb74804f3df3017d558f293c"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.0/switcher_darwin_amd64"
      sha256 "55eb49506e7748a0af45f0e4f8583b25cd2acf064187aa01b2eb61a06520aed6"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.0/switcher_linux_arm64"
      sha256 "3f9bc7dc9bbbeb14b9ecd6bc76fab52d95d91d11508277a86708af04a2611ebd"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.0/switcher_linux_amd64"
      sha256 "8685d51a47e12852d448a97e10d0ca2da5cb37a5fbd7560893493a5589fbcc35"
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
        if Hardware::CPU.arm?
          bin.install "switcher_linux_arm64"
          mv bin/"switcher_linux_arm64", bin/"switcher"
        else
          bin.install "switcher_linux_amd64"
          mv bin/"switcher_linux_amd64", bin/"switcher"
      end
  end

  test do
    system "#{bin}/switcher", "-h"
  end
end
