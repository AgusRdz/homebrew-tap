class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.35.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.1/chop-darwin-arm64"
      sha256 "21738bf7b1ec81b91d971db064716d90ba5ac331462e596ca3fe7cf85cccf567"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.1/chop-darwin-amd64"
      sha256 "79966efae4bbeb64476e12ea30a1732a9e68f162803ebae096e95de29bfc3463"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.1/chop-linux-arm64"
      sha256 "129dc4b458fb8440aed0a4e8412182b4f96fa8ffc7c04c080ccca9ae8379e773"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.1/chop-linux-amd64"
      sha256 "b9aad48efd2ddc35356b0bd6a005ad15699d1d29d7a9c4eab8d62d717610c80a"
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
