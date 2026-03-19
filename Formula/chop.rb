class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.28.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.28.0/chop-darwin-arm64"
      sha256 "ef2e3e1f9bbb6c5a6edf71afb3d1b7e7ce6e83a97e7d87e620b67b50eaec12c8"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.28.0/chop-darwin-amd64"
      sha256 "88279f22dcb206c95dca83f15ca34b50b43f838dea10dba0d3e3c63281a379ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.28.0/chop-linux-arm64"
      sha256 "47df86406289bda7f22dfcf798f5f66a402bba572685b1f7d310c1ffdaab4cc4"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.28.0/chop-linux-amd64"
      sha256 "f09ff22766ac3981685fc9fc7d434b810c416a70197a829445619b7369bf062f"
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
