class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.4.0/ctx-darwin-arm64"
      sha256 "a453e9b23b5ca817de2618f435398601dd443b69155c0e95bdf6c29977a02d6b"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.4.0/ctx-darwin-amd64"
      sha256 "09d2efe2062579fb7448369d90e2b5c5ec753ddffdd87654550685c6d2da7c7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.4.0/ctx-linux-arm64"
      sha256 "8b18d5114c942495f2e88016e6ac9e74ba97b44974cbcf88231159cd42336e37"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.4.0/ctx-linux-amd64"
      sha256 "2996bf303d398ecd3b4deabacc4faaa1a2ceb8d98603b1132ce8524fedb0b3da"
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
