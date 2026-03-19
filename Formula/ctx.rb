class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.1/ctx-darwin-arm64"
      sha256 "e1b6ec2afbd7c4fd9857783b2546d758a53cd4ac8da1d6445fa3c07271336ee3"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.1/ctx-darwin-amd64"
      sha256 "1ec22ac7beda1fc1ad6077b9841c47ea77c826185db35c6cb82014064256021f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.1/ctx-linux-arm64"
      sha256 "361baa43bc5d640faa6a570bb42b3d89c4d3ae766eece47c2b6084cf3a22404c"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.1/ctx-linux-amd64"
      sha256 "b7f5b5d5c636d7d25bcded37e9cdd05d2d9eb833fabe6dda69c1ac3364ba6a65"
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
