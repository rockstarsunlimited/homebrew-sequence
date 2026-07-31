# typed: strict
# frozen_string_literal: true

# Vendor-tap formula for the signed Sequence command-line release.
class Sequence < Formula
  desc "Command-line interface for Sequence media workflows"
  homepage "https://sequencetool.com/docs/cli"
  url "https://github.com/rockstarsunlimited/sequencetool/releases/download/sq-v1.0.0/sq-macos-arm64.zip"
  version "1.0.0"
  sha256 "d11ffa273a42c84c73a72b5a11210c5d186eb04d89c18135fe5737f7056a15e2"
  license "LicenseRef-Sequence-Proprietary"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "package/sq"
    libexec.install "package/libexec/ffprobe"
    pkgshare.install "package/share/sequence/licenses"
  end

  test do
    assert_match "sq 1.0.0", shell_output("#{bin}/sq --version")
    assert_match "action catalog ABI: v1", shell_output("#{bin}/sq doctor")
  end
end
