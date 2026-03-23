class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.2.0/ctx-darwin-arm64"
      sha256 "ce3164726a0ae6606bd2b9d4932afda58f2d6e6235111c125205006511bdff70"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.2.0/ctx-darwin-amd64"
      sha256 "502b36bb04b605959e265fb46acd09ba6318b4aea0ad370397098cce92243331"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.2.0/ctx-linux-arm64"
      sha256 "589e0b19ec0321ec27ad94763f8289476ff0feb0cb7963999c0b4b3bf82a3fdd"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.2.0/ctx-linux-amd64"
      sha256 "7347afc8bf6cbfe7d1843d31b5223346ab813b1d44e0f6ef592e71237edb43d4"
    end
  end

  def install
    binary = Dir["ctx-*"].first
    chmod 0755, binary
    bin.install binary => "ctx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ctx --version")
  end
end
