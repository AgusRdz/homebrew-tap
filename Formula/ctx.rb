class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.3/ctx-darwin-arm64"
      sha256 "b6f7a3ce0838ce9d9a9291fced7bb4e1ae51d88d5e239666a8e88f7e746154b6"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.3/ctx-darwin-amd64"
      sha256 "b29eb4acb2ef0fa2221f0d735841fbfcbffe44ad17717e0bfa6a14bd65b5effb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.3/ctx-linux-arm64"
      sha256 "acb6318b454430f0e0ca171abd43a79af1f1a5811bca0a95c5bba11e6c36000a"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.3/ctx-linux-amd64"
      sha256 "8807ac3f188a7f3b962781129993c76ce6cad1320a74856a040a4e9303c1b677"
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
