class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.33.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.33.0/chop-darwin-arm64"
      sha256 "bedadf451e947a9c3a8dd34fa746408c337f39fcc2dbfb2564efedef064ceac3"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.33.0/chop-darwin-amd64"
      sha256 "9bfa3b23908178df70a23d44a794556bd45341406d2620d5adaa4bdef6a342e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.33.0/chop-linux-arm64"
      sha256 "25af56bd45c7b9a404ed8ed9b31b7ae92542c179b6c9ce2d3dcf7f0ab31ba940"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.33.0/chop-linux-amd64"
      sha256 "f2327342d9731ca1d3c20743f15db5f66b15aa710f8d3ce382cc188ebe21a92e"
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
