class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.24.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.24.0/chop-darwin-arm64"
      sha256 "52b2dd23cdca57fe1da23ccd7ec56c455857bd5f8b87a38bd95eadde06541210"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.24.0/chop-darwin-amd64"
      sha256 "e33a6f6f279cf342515e629f9b69f9373da3dd4ce19927e0e4f3c9bb46685947"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.24.0/chop-linux-arm64"
      sha256 "fdad5e303f6f3368b1e74dff953738f26e2b5d46ae1445440ecabbcc1b6cd262"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.24.0/chop-linux-amd64"
      sha256 "162e57126ee4d6a69b64e465e4367fef09a7c7b95faf68c9d49859f8766d91bf"
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
