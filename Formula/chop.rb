class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.23.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.23.0/chop-darwin-arm64"
      sha256 "93c6d6f898880492fe2b176fd92f1dd8ee58ba453fd4ff66395fb53bcb01f357"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.23.0/chop-darwin-amd64"
      sha256 "9d849e8728a710134e5b02fb236e2d951186ef69e7c57b833e3aba1645097214"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.23.0/chop-linux-arm64"
      sha256 "becc7753c182baa9c41179bdde7071bdea58e09b4eb72ef5646b5f85252a4e95"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.23.0/chop-linux-amd64"
      sha256 "95d14ae155437445e222b53f7ac57085531ed6818609f1f87cb34afe28b60618"
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
