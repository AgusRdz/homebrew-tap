class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "0.7.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.5/ctx-darwin-arm64"
      sha256 "4fe80b2539c0edb5b3110832f68844c75259e9e14f8112e64c790738dbc85018"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.5/ctx-darwin-amd64"
      sha256 "c990fa094b05bdfeb82f191f9dee22d347dda870326b58f630bd8212a4e3a46c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.5/ctx-linux-arm64"
      sha256 "6775a7f778ffc71cc09c08ce441bf6796777456999e8ec287ede0af2d9a1cb6c"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.5/ctx-linux-amd64"
      sha256 "8721483888dfbdb94d67d931c88d0efa33d03f9e31dabd9f0776f86ac60ecb0d"
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
