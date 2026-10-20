# typed: strict
# frozen_string_literal: true

# Vendor-tap formula for the signed Sequence command-line release.
class Sequence < Formula
  desc "Command-line interface for Sequence media workflows"
  homepage "https://sequencetool.com/docs/cli"
  url "https://github.com/rockstarsunlimited/sequencetool/releases/download/cli-v1.1.5/sq-macos-arm64.zip"
  version "1.1.5"
  sha256 "835d615d2ae67cc6b8d55a719267d1fd13e8b60c1ad978b7545f7aad80860795"
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
    assert_match "sq 1.1.5", shell_output("#{bin}/sq --version")
    assert_match "project.list", shell_output("#{bin}/sq actions list")
  end
end
