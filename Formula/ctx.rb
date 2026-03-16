class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "0.7.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.6/ctx-darwin-arm64"
      sha256 "eab3c00d68930199003cd8d53d53aa43b488b579580c9bd628032f2b9a3666a3"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.6/ctx-darwin-amd64"
      sha256 "96868828c25fc607e8897609881534d69a9b30c273d918b625f2c10b2ec30937"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.6/ctx-linux-arm64"
      sha256 "b65564a9c7f7660ca3604ff6d8f5f6a98938d288c2d3af26e7a7b06867426e87"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.6/ctx-linux-amd64"
      sha256 "891e029c59bf9f084815a0631759636041454e9c25770ff0eb190dc0a37f60da"
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
