class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.30.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.3/chop-darwin-arm64"
      sha256 "a5ac87efc33cc8fb5a4086779c6ae1a2b38e7503fa1ca4ac292d7c9936cf6527"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.3/chop-darwin-amd64"
      sha256 "67bfca8961dbc0047c72e8b8987ae1b2f6ac505e4324fbb406f7b0db0987134a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.3/chop-linux-arm64"
      sha256 "77d313c9f785b724db48167470a8ac2570644a82ac454e02a527c4f58f6d2873"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.3/chop-linux-amd64"
      sha256 "2f34010bdfc97d82668eb7b589da309e1bdba1290dc2388668e76f366eab6875"
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
