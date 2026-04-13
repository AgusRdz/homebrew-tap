class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.3/chop-darwin-arm64"
      sha256 "1b9c34890ef4b96e4097ea497211d2521ea0ec8e5bfbc843e6f80df981f86b55"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.3/chop-darwin-amd64"
      sha256 "43dc84c8066fe91452649d80e2fe822018ac5fd769281b9a987dc44417c73eb9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.3/chop-linux-arm64"
      sha256 "ceede1ce6a85a416e2a1891635a72d6247977cf352dad9595a75f3bff4b44758"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.3/chop-linux-amd64"
      sha256 "f8e0b2cad0124f93e70b78c988d5f854857381d4e8877b66e2852a232531ff11"
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
