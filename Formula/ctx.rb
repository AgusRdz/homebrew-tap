class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.4.2/ctx-darwin-arm64"
      sha256 "d4d9278a69cdcae976e99c9effcd965350a62052d04855cc8251f3146d7e93df"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.4.2/ctx-darwin-amd64"
      sha256 "995c80bd4d6623187884b1fcb565e99431557a4a6901814356b63c921cf64385"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.4.2/ctx-linux-arm64"
      sha256 "bef704ff447c51804dd735f5c385821260078e3d7936817129906b1225b5d399"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.4.2/ctx-linux-amd64"
      sha256 "96ac91dd6de0597286a4e6f70b19076510209b2cf710e6e0da0cf16f93550e86"
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
