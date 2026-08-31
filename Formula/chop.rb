class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.13/chop-darwin-arm64"
      sha256 "5d576ee03a2237e0d01fb38a1f7117bd6702dad57f78382023fd2327a5462ef9"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.13/chop-darwin-amd64"
      sha256 "367b72a1cfbb415479a50e8ccdda2ef4a7edcc1da055126edc587c7da4603402"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.13/chop-linux-arm64"
      sha256 "5d8d633c58ff3855610e2e5d804c7f4ed5389a46d1900d746b8edde04958b80e"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.13/chop-linux-amd64"
      sha256 "766a465be159f67bb40acc2a076365edf48988346be0cd16b2b331cf010f6510"
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
