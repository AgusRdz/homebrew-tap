class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.8/chop-darwin-arm64"
      sha256 "2909e390b445baf5d11a66fb96c1d6afcc365dcb2118dce5c17f334897f0d6f5"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.8/chop-darwin-amd64"
      sha256 "474b864bb52aeef8580424d0d47027eacd863091af770caab17674d0895383a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.8/chop-linux-arm64"
      sha256 "f7488642d27022766b69e4b428537bfec20fed6002f72f9486f59e62af3bac57"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.8/chop-linux-amd64"
      sha256 "76b959cf10a6a18081f04428d4371f9d858fd562902a1f52ec2cbcfb3cd8e68b"
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
