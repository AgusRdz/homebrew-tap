class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.27.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.27.0/chop-darwin-arm64"
      sha256 "709dfdfba12da060d0b8775b3cf4133caaa0e9ba61a6b6f44e9b2cba222d75c4"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.27.0/chop-darwin-amd64"
      sha256 "f52cd3aba067b5f40d3071bb648cbce6184ca46e05270146a1cfab053f603b36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.27.0/chop-linux-arm64"
      sha256 "564e8f38f66822f6f5293cff79dc4cc1b685e6d8c01b216ad79d012449f362c7"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.27.0/chop-linux-amd64"
      sha256 "4bc310e3e204839edc98c2cd4e927fe13e96c4a3ed033f17d71620f80ff6866e"
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
