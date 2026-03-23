class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.29.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.29.0/chop-darwin-arm64"
      sha256 "8b88ba212b3b900b629e673d061a88b7f3bce648281ca624f701a49f432a6f3d"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.29.0/chop-darwin-amd64"
      sha256 "96a16175565e0f6126d33e916567224eb9ba6e1adbdb9df7373507f8ff8d6296"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.29.0/chop-linux-arm64"
      sha256 "53a5fee3bc9576a550a8cae616820228ece49b5821c69d6aaa8bee865a35753a"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.29.0/chop-linux-amd64"
      sha256 "5d6b85a02a35c8927ef08630868caff3d5dc7ed545b3217a838f5c2478147a69"
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
