class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.7.0/ctx-darwin-arm64"
      sha256 "a162517c211d788bafb39736fef46af4feda3a7536f15c2acab62d179e3b9800"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.7.0/ctx-darwin-amd64"
      sha256 "e91ab8b1b681ae1d03ac8ec8dcb3b0ee818bb5a046ad4491f60ec79a6efab0b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.7.0/ctx-linux-arm64"
      sha256 "f427c610c7f99db89fcac43baba48ceda314722857f1c712060982b9133eaaa0"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.7.0/ctx-linux-amd64"
      sha256 "cf39e8f682111e4e8849e89676b33498d3b6c5a475edc8bde257694d62f60d35"
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
