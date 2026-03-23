class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.2.1/ctx-darwin-arm64"
      sha256 "3ac2e60817df94b786d7d095313135b77f90f12095a50551e1ab272d154ea978"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.2.1/ctx-darwin-amd64"
      sha256 "09f2e0911ce90bf48d3e2b529a1dcc9873719908a3a156e3c3f41f789e5e33c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.2.1/ctx-linux-arm64"
      sha256 "ecff002112c8ffae6d5b5362ec7857ab2d4c5ecc624b12705b0353f2f281b706"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.2.1/ctx-linux-amd64"
      sha256 "a614f78ece59f7a9a87aef50e4e2f2a60593285120f55a8f35f461d07f7f31e2"
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
