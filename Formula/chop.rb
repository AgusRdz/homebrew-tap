class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.12/chop-darwin-arm64"
      sha256 "4b69f30d1e36b9589b6450476c44b1e4e83165dca574ea94236ee87026b74d2c"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.12/chop-darwin-amd64"
      sha256 "7de66e1fe92c7553d2ee9f57e1bf59116922d8062583b8d398d765e9bbcd9190"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.12/chop-linux-arm64"
      sha256 "ae83dcf6cf928b9c9d0ad9e665bd3a75eb24af91627527d4fefac83f85ac9989"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.12/chop-linux-amd64"
      sha256 "b2ad28898b24920f2ad280a52afdc7165cc951845934f3d4926031470b295792"
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
