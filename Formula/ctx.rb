class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.5.0/ctx-darwin-arm64"
      sha256 "2ffbcd03825954b39a911f1a3fd660706080d532f40e175a71631a6abbb2ea71"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.5.0/ctx-darwin-amd64"
      sha256 "b9e5c67c450540757f81011f696c86e920a35ce790786cff39365ba2c8002f4d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.5.0/ctx-linux-arm64"
      sha256 "34c7aad3989f9d41c179de63451225eb9d6ed774eb3a106a6db49561b7021b57"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.5.0/ctx-linux-amd64"
      sha256 "c8ea10bc644daf54e8f9738131a3f9cfdde013cfe65d73dda109b37f9e3031cc"
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
