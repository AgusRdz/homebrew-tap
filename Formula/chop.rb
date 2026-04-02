class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.35.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.3/chop-darwin-arm64"
      sha256 "5ca764d3292a317cb6b68bd9eb6c43ba65747aa44322110365908ad854287f63"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.3/chop-darwin-amd64"
      sha256 "2d7003f905123af67aebdd9b276050e470407153f8d11252a09e45a98e05980d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.3/chop-linux-arm64"
      sha256 "5f6d3f14110e82acde795ad87d297a173296092fee8ace3f305dc7f20fb2972c"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.3/chop-linux-amd64"
      sha256 "f0354ef96e1c1edd61bd929d23ccd64c6ff8e2b015fdd68b722b0cf23b048e94"
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
