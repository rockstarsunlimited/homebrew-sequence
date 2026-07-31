# typed: strict
# frozen_string_literal: true

# Vendor-tap formula for the signed Sequence command-line release.
class Sequence < Formula
  desc "Command-line interface for Sequence media workflows"
  homepage "https://sequencetool.com/docs/cli"
  url "https://github.com/rockstarsunlimited/sequencetool/releases/download/cli-v1.0.2/sq-macos-arm64.zip"
  version "1.0.2"
  sha256 "52c14736c49bb0cc8c7680e1974583ebd341c315ccc8723c720bb100a424d130"
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
    assert_match "sq 1.0.2", shell_output("#{bin}/sq --version")
    assert_match "action catalog ABI: v1", shell_output("#{bin}/sq doctor")
  end
end
