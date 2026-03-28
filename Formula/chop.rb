class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.31.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.31.2/chop-darwin-arm64"
      sha256 "7da812b90a6a3972a1acc4badfe2d4cf3897ca077b1b5d97b005278187217ffd"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.31.2/chop-darwin-amd64"
      sha256 "ec929741f2efdca7de3a1f20afbc8efee62296284279e858dfa8de009e1a0983"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.31.2/chop-linux-arm64"
      sha256 "6b8742b88af8b468fa2fc84816a1a89f633a7dbf8b58303f7530675e83699c5c"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.31.2/chop-linux-amd64"
      sha256 "1b5e521ecdfa44bcf81924e4dbb758d3881bf3ed6c62712632e7e04cde0efe69"
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
