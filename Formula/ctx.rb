class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.6.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.2/ctx-darwin-arm64"
      sha256 "8fb218268dcf4dc5e67a9400ef82739bbe35f70886dc105fe553d7a65b1faa2c"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.2/ctx-darwin-amd64"
      sha256 "020f2f3c0664f546bf3e70d8ae8bf2a9d34da4de946fe3bd2a2063a2acb4137a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.2/ctx-linux-arm64"
      sha256 "61b530d9a6f86b19d2b615f7b150bc33388be32d7f87f52fff310c197b29402f"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.2/ctx-linux-amd64"
      sha256 "81cfd88a55d8ac370f39914e78834629bed08cc5fb72e7556169f5daab2c99ca"
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
