class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.0.0/ctx-darwin-arm64"
      sha256 "ec0c16d16c0b8b3a9bcd85eab7d8932d64eedd456ab8dbbcfb2924c04a48a8e3"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.0.0/ctx-darwin-amd64"
      sha256 "06174522c6f95c58b53592fc7d611f64c58216baa694875012cab65a38e8d90a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.0.0/ctx-linux-arm64"
      sha256 "3c396c1f2c333b1c6298abbddc5dc4f1f5fd5912c7a374ec11ffc46fc5fb99a2"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.0.0/ctx-linux-amd64"
      sha256 "e28b966f05bc0f161edb1c4b8b597015d75e399f95d06a3a52670148c982ac9a"
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
