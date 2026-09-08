# typed: strict
# frozen_string_literal: true

# Vendor-tap formula for the signed Sequence command-line release.
class Sequence < Formula
  desc "Command-line interface for Sequence media workflows"
  homepage "https://sequencetool.com/docs/cli"
  url "https://github.com/rockstarsunlimited/sequencetool/releases/download/cli-v1.1.2/sq-macos-arm64.zip"
  version "1.1.2"
  sha256 "df1f5ecec0ec5f0a8128ca4b1a2c0e5bfc4dee24f61f13591e231a3f52fb21b4"
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
    assert_match "sq 1.1.2", shell_output("#{bin}/sq --version")
    assert_match "project.list", shell_output("#{bin}/sq actions list")
  end
end
