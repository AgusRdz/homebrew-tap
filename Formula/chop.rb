class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.2/chop-darwin-arm64"
      sha256 "a07c3c7666afae9df59d03e9b7b53c307bddd09e751235c11105b1a9fab5f965"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.2/chop-darwin-amd64"
      sha256 "c85afd07730d733fc36640f418f1d6ec887c4ab3bbf80755deb8dca5ee47d1ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.2/chop-linux-arm64"
      sha256 "98b0e6a245f5120898d6154b9faa5b0f79620774322c73ebafe1321aef698ee5"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.2/chop-linux-amd64"
      sha256 "cdaac6c2b8a21fd92fe34fe0d92593501fe8a04e6a33ae8ed91de35acb0d5798"
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
