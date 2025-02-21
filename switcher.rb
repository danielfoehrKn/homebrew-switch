class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.9.3"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.3/switcher_darwin_arm64"
      sha256 "46b13af9cb317f5b24ef4fb48ff15781836e25f4168325879abb60bccb993e4f"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.3/switcher_darwin_amd64"
      sha256 "c6c0bb367922bb17af1165d2b97052696f48ca267d449fd2394e04fbcf1666a6"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.3/switcher_linux_arm64"
      sha256 "7597a5f9f755100969e10ec2f6142dcd9b1ec4012adc227a3aa90ea04964974d"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.9.3/switcher_linux_amd64"
      sha256 "8554ac5b8767ec337025e01d468bcf9e90be56a0b23891bbb47ecfe4191fa56f"
    end
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
  end

  test do
    system "#{bin}/switcher", "-h"
  end
end
