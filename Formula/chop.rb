class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.10.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.10.4/chop-darwin-arm64"
      sha256 "45c253a90ada6a7f19a20c3d127d68dd2cce5b754eea1ff8ff156753793d6bf3"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.10.4/chop-darwin-amd64"
      sha256 "f6ee3b31f36cdd4f5f71714bc36d9dfd9d5be444f0ad3f671475738b3ae0ebac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.10.4/chop-linux-arm64"
      sha256 "138e145df94a6f12d84c0a530145cda16b2ad58487122d9614fd87907bc89b09"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.10.4/chop-linux-amd64"
      sha256 "be9eec2ffe96e9c1b5f0fdd560cacd140662186748ddabc13bed99aa99918fb6"
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
