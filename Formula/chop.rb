class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.26.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.26.0/chop-darwin-arm64"
      sha256 "33c7b00d7855469a2d1c243dd5e9cb0837ac4cee2a315821c6fff0b18011178f"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.26.0/chop-darwin-amd64"
      sha256 "c7e851c4def3baa7a8e9681d5e8fa8fcf6e891f50a5f818a6c8e82d069bbdb69"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.26.0/chop-linux-arm64"
      sha256 "639e997e8fcaf499b06f1aa836b1cfc2f4693ac156301981065b394ce9d18e5c"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.26.0/chop-linux-amd64"
      sha256 "5403199336ef43d67b0957f37c2362f3e7bbfe7388c5b4df5b89850168a4eb13"
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
