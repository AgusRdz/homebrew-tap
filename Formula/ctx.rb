class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "0.7.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.9/ctx-darwin-arm64"
      sha256 "8d2114ea79431afc4a3b78cc30f41745299ab875eb8b26a1e0e6abe6ecd97797"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.9/ctx-darwin-amd64"
      sha256 "ec93dd580f5f0a09da50d3b2942341ac6e50afd13e7e1561c494beb38963eba8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.9/ctx-linux-arm64"
      sha256 "7e18c94af4c6905e65a9a4452a22dfa32fbd09fc8f4bf856d105632b342338e8"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.9/ctx-linux-amd64"
      sha256 "8a16c6b4aa2b206f28e0ba8e35b4921296897cfb0ce5b464217380b825ccf62f"
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
