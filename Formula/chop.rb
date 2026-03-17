class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.25.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.25.1/chop-darwin-arm64"
      sha256 "3223c8773cb50dec7e7f1eb50d29a87b97407fdb02fbdf7edffe509d945f09b1"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.25.1/chop-darwin-amd64"
      sha256 "c737b7a441266810b21eada1d6ed63fa5972f6cb4d89473d9eeb0a68682f5c64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.25.1/chop-linux-arm64"
      sha256 "ab6f6e3e4673eb2953cc119185bdbce90bf9685f15c38b5c5c94bd94313d7422"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.25.1/chop-linux-amd64"
      sha256 "5a61ea8eadb7a7089b08dbb45c84f6be7e94a245bd0d0f9d0f7b364ee52365a8"
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
