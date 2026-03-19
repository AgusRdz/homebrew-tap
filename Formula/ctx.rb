class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.0/ctx-darwin-arm64"
      sha256 "a183e1295f4becaf2b91df814526bae52f0f657974c9b87d0e2304ff60755678"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.0/ctx-darwin-amd64"
      sha256 "2e471ee2bdfb45bbd42286437771c86e56c8607f3945b2149ed1c62987ae467c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.0/ctx-linux-arm64"
      sha256 "f496effd0aa2347883dcfe2b1e32eb7026e333aac5a5cb88d5ae7297d8e47e62"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.0/ctx-linux-amd64"
      sha256 "31aeb9afd9b34be3f877f8151ae7a165d591815f4800fb287986c83a03055d7c"
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
