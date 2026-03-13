class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.11.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.11.1/chop-darwin-arm64"
      sha256 "3da21aefa7d31d5f4997fd7005e33c3e17f776c938e10d89f791471e1c3f2dc0"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.11.1/chop-darwin-amd64"
      sha256 "13bd35db272b7dd9b501fbc8002215b872ec76b7d6db962c11cb635cad159ee4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.11.1/chop-linux-arm64"
      sha256 "ab28ebc812747728d4109c89eb9ed65ef69d87e4c8cd5fb5f4b3b6ab7ad8690d"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.11.1/chop-linux-amd64"
      sha256 "6921f538e08483ddf08ede063d36f854414061481a5043dd3056135b7cc25139"
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
