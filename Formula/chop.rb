class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.35.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.2/chop-darwin-arm64"
      sha256 "fe5d0ea44b91828bdb1cb70e44863ac6a5fefac947ccc8ac4c96eadd32858c32"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.2/chop-darwin-amd64"
      sha256 "07371be3f1e9c428d5475d3b969206515508383a0ee4cdd0c8ccb4f2ecfd928e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.2/chop-linux-arm64"
      sha256 "10ecab6edec8c836efa9fbf73e1d1e488a434e67cc7478a5b72e7cf6105b099f"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.35.2/chop-linux-amd64"
      sha256 "c9abd9d45902f9886b41fa76293867ec73707771244c89d0199c9be048e6864d"
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
