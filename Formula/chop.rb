class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.12.0/chop-darwin-arm64"
      sha256 "677a33c1b80dbc0b1d7d76f7622c395750c7b89fe36606a0f1fd9570e0a596a2"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.12.0/chop-darwin-amd64"
      sha256 "9ff9363fe92db6ea8146607b18da91c7ab4d8095435f976e1c38025ed37c15c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.12.0/chop-linux-arm64"
      sha256 "58db4692caa91eb0483169373f1481013df5746af512f9797c55df486b778ef8"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.12.0/chop-linux-amd64"
      sha256 "973e2e2602a99fe0bdcd2d8757aef2153e603051480fa472dfa67f7a2583b217"
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
