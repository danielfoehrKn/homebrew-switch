class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "0.3.1"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.3.1/switcher_darwin_amd64"
    sha256 "0c1bd35100153682f3009aa3741480cf488c7bd42ef0b739a149c7653784f942"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/0.3.1/switcher_linux_amd64"
    sha256 "ed7e48a962300c60c2bf1c0d7ecd284c0564272062abe29e6319bd6029d2655b"
  end

  depends_on :arch => :x86_64

  def install
      if OS.mac?
        bin.install "switcher_darwin_amd64"
        mv bin/"switcher_darwin_amd64", bin/"switcher"
      elsif OS.linux?
        bin.install "switcher_linux_amd64"
        mv bin/"switcher_linux_amd64", bin/"switcher"
      end
  end

  test do
    system "#{bin}/switcher", "-h"
  end
end
