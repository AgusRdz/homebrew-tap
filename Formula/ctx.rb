class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.3.0/ctx-darwin-arm64"
      sha256 ""
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.3.0/ctx-darwin-amd64"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.3.0/ctx-linux-arm64"
      sha256 ""
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.3.0/ctx-linux-amd64"
      sha256 ""
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
