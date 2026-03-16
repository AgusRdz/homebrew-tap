class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "0.7.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.8/ctx-darwin-arm64"
      sha256 "8a7f7b3ce376f6a051b3495baf50b0512c5cc2ddb54ed94068e548072b9b302e"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.8/ctx-darwin-amd64"
      sha256 "61aa399f159ed77e493aee5e9f60ab759129111522e7337f6575f2cdda4b906f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.8/ctx-linux-arm64"
      sha256 "7473aa7a0e74ad87e3366ef4960e523dd010c763587477082bc454daccaabde8"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.8/ctx-linux-amd64"
      sha256 "5f892f943201d23b5924c7147e5a468bd1481080e0a606a9120608b620f55cc1"
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
