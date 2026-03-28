class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.31.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.31.1/chop-darwin-arm64"
      sha256 "8fbe3ae3e60003ea6e8415ee742d6a912d89f7869291f3d082264f6777ec40c6"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.31.1/chop-darwin-amd64"
      sha256 "06a8162edb12d253dde0bc004b9543aeeacc4c22d8fc7521a0248fad85fa0e7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.31.1/chop-linux-arm64"
      sha256 "de0423f08b78bdb74833713939f142744d78c88b1c2b9482b1dc979b3b4bb962"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.31.1/chop-linux-amd64"
      sha256 "c4b6eec22cec3b227ef8b580ff6e1529a0f853b8bab80c821cd6a47d00f57422"
    end
  end

  def install
    binary = Dir["chop-*"].first
    chmod 0755, binary
    bin.install binary => "chop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chop --version")
  end
end
