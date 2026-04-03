class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.35.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.4/chop-darwin-arm64"
      sha256 "786aef3aa0569d03ad94a3b7c84afc49df3a20d28cbd89fe0ae5055778a81e47"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.4/chop-darwin-amd64"
      sha256 "d19cdb2b656faff85799f2681865fd2e0217b29a2f2a56a886e0a91ab6435857"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.4/chop-linux-arm64"
      sha256 "6f25291a45264fade9f0874b2063094e4b534926c452cc95db749aa7de8599db"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.4/chop-linux-amd64"
      sha256 "216816e285b52cb4f5f5a8085dd1ced297d0737cc48da6393d0a00e2ca6f91ea"
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
