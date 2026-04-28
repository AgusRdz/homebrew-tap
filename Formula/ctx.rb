class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.4.1/ctx-darwin-arm64"
      sha256 "2d5302a74ba81a13661fda37aba5a62717504c4c6a05f6100b37158bc7d808ec"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.4.1/ctx-darwin-amd64"
      sha256 "5758d2f4919137db17a5295763a615979b8b87460b015941492da82852d804a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.4.1/ctx-linux-arm64"
      sha256 "44914232657c1a49a1fbb97b13e2ad01be903a73be95c36c22d89a2c6189735a"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.4.1/ctx-linux-amd64"
      sha256 "07d5907d4799c5e1548a30143dfd4dc83178d56751fbafd12b48ae90107d9a2c"
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
