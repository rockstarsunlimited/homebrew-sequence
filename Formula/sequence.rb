# typed: strict
# frozen_string_literal: true

# Vendor-tap formula for the signed Sequence command-line release.
class Sequence < Formula
  desc "Command-line interface for Sequence media workflows"
  homepage "https://sequencetool.com/docs/cli"
  url "https://github.com/rockstarsunlimited/sequencetool/releases/download/cli-v1.1.4/sq-macos-arm64.zip"
  version "1.1.4"
  sha256 "242534a335ec1b8b88b3e6dd7a5d2d10850b5a493ed247b097d330fcdec52317"
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
    assert_match "sq 1.1.4", shell_output("#{bin}/sq --version")
    assert_match "project.list", shell_output("#{bin}/sq actions list")
  end
end
