#!/usr/bin/env bash

tag=${1}
mac_sha=${2}
linux_sha=${3}
switch_script_sha=${4}

if [ -z "${1}" ]
then
      echo "release tag is not provided"
      exit 1
fi

if [ -z "${2}" ]
then
      echo "mac binary sha256sum is not provided"
      exit 1
fi

if [ -z "${3}" ]
then
      echo "linux binary sha256sum is not provided"
      exit 1
fi

if [ -z "${4}" ]
then
      echo "switch script sha256sum is not provided"
      exit 1
fi

echo "Update to tag: $tag"
echo "Update to mac SHA256: $mac_sha"
echo "Update to linux SHA256: $linux_sha"
echo "Update to switch.sh SHA256: $switch_script_sha"

cat > switch.rb << EOF
class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "$tag"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/$tag/switch.sh"
  sha256 "$switch_script_sha"

  depends_on "danielfoehrkn/switch/switcher"
  depends_on :arch => :x86_64

  def install
    prefix.install "switch.sh"
  end

  test do
    system "#{bin}/switch", "-h"
  end
end
EOF

cat > switcher.rb << EOF
class Switcher < Formula
  desc "Providing the binary executable for the 'switch' script."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "$tag"

  if OS.mac?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/$tag/switcher_darwin_amd64"
    sha256 "$mac_sha"
  elsif OS.linux?
    url "https://github.com/danielfoehrKn/kubeswitch/releases/download/$tag/switcher_linux_amd64"
    sha256 "$linux_sha"
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
EOF