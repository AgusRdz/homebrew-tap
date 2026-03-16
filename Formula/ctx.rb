class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "0.7.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.9/ctx-darwin-arm64"
      sha256 "974c5de4567168a2e9e5ebfc8e5879dd50a35b1842f0d48daa216db1e915e144"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.9/ctx-darwin-amd64"
      sha256 "fd296708725331a4915e71628f5457186aac24f5511641bb7326735bb8cbd06d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.9/ctx-linux-arm64"
      sha256 "3deff92d44fa2581b35246c1ab9505e06fdb311321f5fee61f1ec8d1fcaa9560"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.9/ctx-linux-amd64"
      sha256 "0febd095f2a4cd0495e6e1d199ce98c262aba7759ac8c1595ec579ac7e184d16"
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
