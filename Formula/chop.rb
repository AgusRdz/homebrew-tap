class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.35.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.0/chop-darwin-arm64"
      sha256 "623aba1654cef2ec26d61ce6c7b1b84f61c8f875f3e247952bf93adecd7a04d2"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.0/chop-darwin-amd64"
      sha256 "1aaadd29ec3059cc29cca997b98fcb40cb38094d06071d546c6d3aaacafa953b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.0/chop-linux-arm64"
      sha256 "dbef599d6f1e65f42cad89965ea8f392b5511906e984f57b84d75ded1e11344e"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.0/chop-linux-amd64"
      sha256 "8a4677252fe072cdcc705a7135308250ea284d4e91b3348be65e43237ffadba4"
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
