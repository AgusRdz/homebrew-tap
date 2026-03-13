class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.11.0/chop-darwin-arm64"
      sha256 "2a000ef98b70170a055f396a524cb3760a42d2cc6703302b20e0003bfdc64521"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.11.0/chop-darwin-amd64"
      sha256 "1cb3fed8cf8537da825cb5f92cac9ab85b4075691c39b4bcc656abb77da2a0c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.11.0/chop-linux-arm64"
      sha256 "91f60d4b567616f4ed131fe6f855f199ba4876f5972a5fc9ae924008ad1c5afb"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.11.0/chop-linux-amd64"
      sha256 "9c44e8c0654ebc34919c7ffb3c7d3ce13f9fcc5a4261ad8d639b0c6cec839c35"
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
