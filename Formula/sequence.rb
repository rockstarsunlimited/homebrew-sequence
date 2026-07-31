# typed: strict
# frozen_string_literal: true

# Vendor-tap formula for the signed Sequence command-line release.
class Sequence < Formula
  desc "Command-line interface for Sequence media workflows"
  homepage "https://sequencetool.com/docs/cli"
  url "https://github.com/rockstarsunlimited/sequencetool/releases/download/sq-v1.0.1/sq-macos-arm64.zip"
  version "1.0.1"
  sha256 "511cb4247bf12970fdc97f08650ab68f9b2d54808dd2cb00fa5d28a7e455fedf"
  license "LicenseRef-Sequence-Proprietary"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "sq"
    libexec.install "libexec/ffprobe"
    pkgshare.install "share/sequence/licenses"
  end

  test do
    assert_match "sq 1.0.1", shell_output("#{bin}/sq --version")
    assert_match "action catalog ABI: v1", shell_output("#{bin}/sq doctor")
  end
end
