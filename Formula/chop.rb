class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.31.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.31.0/chop-darwin-arm64"
      sha256 "6f119d7e52380ab7400f62b7803a2e445ed1246c5f5ccd068f4ed14a179414af"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.31.0/chop-darwin-amd64"
      sha256 "a8fc52b6a3bbc5cbfc6decc3e73192383bfaf36fa644346804b2973033ed70f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.31.0/chop-linux-arm64"
      sha256 "a30321bf9c5c2fcd0bc234e4d325b8c0f75c977f93df1a8c8025bb3ae9ed17ee"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.31.0/chop-linux-amd64"
      sha256 "3cac35e1a97e73b92b693b56a6dc4d3711d658a4daaa39d789ba2936e540b8db"
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
