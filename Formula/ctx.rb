class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.3.0/ctx-darwin-arm64"
      sha256 "0a34eed7b1212156aa99f144e436962167a68605f61296cbb42341ee8e00c4e9"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.3.0/ctx-darwin-amd64"
      sha256 "5a62dab56f90b526835a9838998c6922741c8b0ece3d932c24787db28dc953b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.3.0/ctx-linux-arm64"
      sha256 "c33690f65b4c4a77dd103b88685d5b7c08ee343821b23ceee8bcaeb67e74fe1e"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.3.0/ctx-linux-amd64"
      sha256 "1a9a99fa7a97d1cc3d68f79af32fb1da6fa1a348f5c52e3b2c805e2242a91113"
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
