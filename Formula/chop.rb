class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.32.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.32.0/chop-darwin-arm64"
      sha256 "8afd135746460d20a62366fa6d5514760186ac7bc7a993cd7c15f10321813255"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.32.0/chop-darwin-amd64"
      sha256 "5c9bf73d670500e0ddfc8b4fae3d984b52303be5b40d89a5fda1d1e681ee5914"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.32.0/chop-linux-arm64"
      sha256 "079e1ae7f1db63e2598b026309a9edc2c2efe145330576aed642dfbcbc17d033"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.32.0/chop-linux-amd64"
      sha256 "5766ae07a2d21cf6b0c7327af12a580a5d3eec71508d3175d5e96262691e7e77"
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
