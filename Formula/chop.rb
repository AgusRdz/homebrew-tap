class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.34.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.34.0/chop-darwin-arm64"
      sha256 "caaba4e888959272094e0c081fafeabcfe64703e569b7437ce054ac22d2665cb"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.34.0/chop-darwin-amd64"
      sha256 "6950b169ebb9c335cf939e9ee3914a1e35f1d09d38965e3b4661e360aea04d68"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.34.0/chop-linux-arm64"
      sha256 "c9841593db0f528b4850b61766e66291b54da006374786a3f54722963646eead"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.34.0/chop-linux-amd64"
      sha256 "66d10cbf8741c25ba86f8553b5f29f520ee2fad4005556e9321f8f832ceb04fa"
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
