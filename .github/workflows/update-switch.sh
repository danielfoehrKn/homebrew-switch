#!/usr/bin/env bash

tag=${1}
mac_sha=${2}
mac_arm_sha=${3}
linux_sha=${4}
linux_arm_sha=${5}
switch_script_sha=${6}

if [ -z "${1}" ]
then
      echo "release tag is not provided"
      exit 1
fi

if [ -z "${2}" ]
then
      echo "mac AMD64 binary sha256sum is not provided"
      exit 1
fi

if [ -z "${3}" ]
then
      echo "mac ARM binary sha256sum is not provided"
      exit 1
fi

if [ -z "${4}" ]
then
      echo "linux AMD64 binary sha256sum is not provided"
      exit 1
fi


if [ -z "${5}" ]
then
      echo "linux ARM binary sha256sum is not provided"
      exit 1
fi

if [ -z "${6}" ]
then
      echo "switch script sha256sum is not provided"
      exit 1
fi

echo "Update to tag: $tag"
echo "Update to mac AMD64 SHA256: $mac_sha"
echo "Update to mac ARM SHA256: $mac_arm_sha"
echo "Update to linux AMD64 SHA256: $linux_sha"
echo "Update to linux ARM SHA256: $linux_arm_sha"
echo "Update to switch.sh SHA256: $switch_script_sha"

cat > switch.rb << EOF
class Switch < Formula
  desc "The kubectx for operators."
  homepage "https://github.com/danielfoehrKn/kubeswitch"
  version "$tag"
  url "https://github.com/danielfoehrKn/kubeswitch/releases/download/$tag/switch.sh"
  sha256 "$switch_script_sha"

  depends_on "danielfoehrkn/switch/switcher"

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
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/$tag/switcher_darwin_arm64"
      sha256 "$mac_arm_sha"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/$tag/switcher_darwin_amd64"
      sha256 "$mac_sha"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/$tag/switcher_linux_arm64"
      sha256 "$linux_arm_sha"
    else
      url "https://github.com/danielfoehrKn/kubeswitch/releases/download/$tag/switcher_linux_amd64"
      sha256 "$linux_sha"
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
EOF
