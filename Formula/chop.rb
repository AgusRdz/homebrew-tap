class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.28.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.28.1/chop-darwin-arm64"
      sha256 "6aad9d6d1d7023b7ccaca8f481ffdbbbc7a6348a56df82c49edcf52f72d81756"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.28.1/chop-darwin-amd64"
      sha256 "9dcda4330d5799042732ba4d3fa4bf2ec8167c3eb5d1f22c2bee1ac8f1e29f78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.28.1/chop-linux-arm64"
      sha256 "207cd32ecfd9045e4dccdec621a72dcfdec11d032ca669e08456c7517049150d"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.28.1/chop-linux-amd64"
      sha256 "1121b94458bd4ae498700aed2a44179aaf315b0ab460247f252937dac7d51a05"
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
