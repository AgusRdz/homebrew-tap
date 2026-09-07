class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.14/chop-darwin-arm64"
      sha256 "cf4a0c024fd0f5a09d21bf377130e63049d7c87a2de8e8214b3edc9e1c6a7562"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.14/chop-darwin-amd64"
      sha256 "09da67ac939064c0194310f5866f4e17b984ef1b2ecfc69b1e4eb93714d8e9d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.14/chop-linux-arm64"
      sha256 "1a2e9929be03775369c87c0e1a36e4dd84b8974b9748ff6830160afd21d87194"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.14/chop-linux-amd64"
      sha256 "b379beba1efc4b6ecf07f61e67940545a30c174cf69cde73b6fce18c1728bbe8"
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
