class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.5/chop-darwin-arm64"
      sha256 "2db5c96f7b344fa96f9c373350b189a4cc053be4a5e896bb8c31e149dc6041fc"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.5/chop-darwin-amd64"
      sha256 "0f697458da8b893ae8c1b645b59bc7eaf6b595684c4f7ad2dfbe45487169ce40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.5/chop-linux-arm64"
      sha256 "1d709e82f11ab127e1ba8a4a6196ce75c5739c3d9634aaf30dcb4e5f695f180a"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.5/chop-linux-amd64"
      sha256 "7e2ab6437c55b1181feef9e5f3a3d021f4981ddf75b1cf8dd35057a6a2a4af68"
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
