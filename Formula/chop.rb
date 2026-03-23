class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.28.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.28.2/chop-darwin-arm64"
      sha256 "570004d5a86fc59b1efb03e0768fdd3a1ebbd0c647246b774f8256e3f5d1bd9d"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.28.2/chop-darwin-amd64"
      sha256 "c5b7d9679a106ba5ce94a7fd9f0d7997e9b1398fdf73161b987fdd8d1f271030"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.28.2/chop-linux-arm64"
      sha256 "24ec9a61abb83ca871098e2f8076e8ad8330d16593eb77c6c368d148980d81a2"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.28.2/chop-linux-amd64"
      sha256 "f96c4a816291574b96b1f81265605a2621c6bfdff57bef0c57d9e48ee4052877"
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
