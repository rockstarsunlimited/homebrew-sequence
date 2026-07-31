# typed: strict
# frozen_string_literal: true

# Vendor-tap formula for the signed Sequence command-line release.
class Sequence < Formula
  desc "Command-line interface for Sequence media workflows"
  homepage "https://sequencetool.com/docs/cli"
  url "https://github.com/rockstarsunlimited/sequencetool/releases/download/cli-v1.0.4/sq-macos-arm64.zip"
  version "1.0.4"
  sha256 "b244d6c5a7d5fd567fbbfc825dc9f5eb164037a29822e1998f05ae02f5404c47"
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
    assert_match "sq 1.0.4", shell_output("#{bin}/sq --version")
    assert_match "project.list", shell_output("#{bin}/sq actions list")
  end
end
