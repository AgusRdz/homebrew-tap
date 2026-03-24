class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.30.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.1/chop-darwin-arm64"
      sha256 "fb9f481e15933ad9da09fb5d48329b872f20b273b6aa0118ea7898cdd762bc01"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.1/chop-darwin-amd64"
      sha256 "419073d58eaab63a0933beb27f534b4054f6594070bdc96cf8878b96b7ee829b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.1/chop-linux-arm64"
      sha256 "17ed9694efecb5216a365796d4f4e4a68e3275a7b2f37dbfeb4e4c601aac93d2"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.1/chop-linux-amd64"
      sha256 "3bc8658a39fb027c719487511492117363b26deafb97465eb985be591d6cc1cc"
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
