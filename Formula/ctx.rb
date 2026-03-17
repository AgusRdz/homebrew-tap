class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "0.7.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.10/ctx-darwin-arm64"
      sha256 "fb67fda22d20ef6c73b07374a2e6a7000950356acc35d319144815d8902180c2"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.10/ctx-darwin-amd64"
      sha256 "acb533e01835b184999e117a5d747eaa3581c888a5e1b15bcd93f774587a9f03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.10/ctx-linux-arm64"
      sha256 "47dfe5802463ec02f4ac404dec40a919d5ce149aee136efae4f62b6f6a3848f4"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.10/ctx-linux-amd64"
      sha256 "ae9bc77059b08743d6e0cb4f2773e6281f94e3cb126f19978273e8fd635289f4"
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
