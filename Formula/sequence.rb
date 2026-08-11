# typed: strict
# frozen_string_literal: true

# Vendor-tap formula for the signed Sequence command-line release.
class Sequence < Formula
  desc "Command-line interface for Sequence media workflows"
  homepage "https://sequencetool.com/docs/cli"
  url "https://github.com/rockstarsunlimited/sequencetool/releases/download/cli-v1.1.1/sq-macos-arm64.zip"
  version "1.1.1"
  sha256 "f11a22e743a9d2f3cbc96bebde25cbfd1a75be45c6402203a77f64b89e99dfbf"
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
    assert_match "sq 1.1.1", shell_output("#{bin}/sq --version")
    assert_match "project.list", shell_output("#{bin}/sq actions list")
  end
end
