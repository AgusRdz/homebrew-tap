class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.39.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.4/chop-darwin-arm64"
      sha256 "a9a8f43402d0ddaa5c3126437329b4cacf5812ae9febb278de6a7f565d107064"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.4/chop-darwin-amd64"
      sha256 "1660949520c0b52a603dd15f370c71dc52474c3a27cda4efe475ea6b8a26c722"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.4/chop-linux-arm64"
      sha256 "4fffe0ee455ea77b6b1972ff4c5781fafc7ab5c83dda54168f6e051f222bcc30"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.4/chop-linux-amd64"
      sha256 "f5e9af1d5adfa67e9fe55bb49477ab6b7035e3c7f2927506972a860cf588a581"
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
