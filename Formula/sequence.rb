# typed: strict
# frozen_string_literal: true

# Vendor-tap formula for the signed Sequence command-line release.
class Sequence < Formula
  desc "Command-line interface for Sequence media workflows"
  homepage "https://sequencetool.com/docs/cli"
  url "https://github.com/rockstarsunlimited/sequencetool/releases/download/cli-v1.0.3/sq-macos-arm64.zip"
  version "1.0.3"
  sha256 "ad7a0e1cfe7746ae4993a6037ccd2cc48ee2c43f65aefbeb2f45641bd8d9424b"
  license "LicenseRef-Sequence-Proprietary"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "sq"
    libexec.install "libexec/ffmpeg"
    libexec.install "libexec/ffprobe"
    pkgshare.install "share/sequence/licenses"
  end

  test do
    assert_match "sq 1.0.3", shell_output("#{bin}/sq --version")
    assert_match "action catalog ABI: v1", shell_output("#{bin}/sq doctor")
  end
end
