class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.0/ctx-darwin-arm64"
      sha256 "baa8f3e8e43bbc601d4f6aefb148be4dc0a1bf880f83806f5db2a88387604106"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.0/ctx-darwin-amd64"
      sha256 "8ed1362e9cc476aaa4f5eb386d694bb35c3d458f489473901495a00edc0d57fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.0/ctx-linux-arm64"
      sha256 "26d635259d3ed0186739f024c2dac033da9b1abfe75ba6bbdfa64ae1a58f8bf0"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.0/ctx-linux-amd64"
      sha256 "4755f852621568fa7b8dce71a6d3ad0710152a6814a8e715fb117021847e6467"
    end
  end

  def install
    binary = Dir["ctx-*"].first
    chmod 0755, binary
    bin.install binary => "ctx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ctx --version")
  end
end
