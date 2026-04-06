class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.0/chop-darwin-arm64"
      sha256 "9feef59b8a2d7371cff9ec2ecd727cda4a1b27b69d0ed28178a2bfaea0e87e58"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.0/chop-darwin-amd64"
      sha256 "423f8c6b7d840677d9d599dee4a44912ae7ec3d183dcd15f88a6860952753e10"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.0/chop-linux-arm64"
      sha256 "5aafc39bfbb16e0a501adc50eb703bb2ae629516f1e04e8eb427bc5996fefe51"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.0/chop-linux-amd64"
      sha256 "d848e5987bbe4cd62ac2ae2df0c14f995e9ec9b35e3769efbf5e6acc166acaf4"
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
