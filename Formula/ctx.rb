class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "0.7.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.7/ctx-darwin-arm64"
      sha256 "f99bce8eaf6c5e293b380e5f56efab299765005f3889fcf9bb430cff3b48724b"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.7/ctx-darwin-amd64"
      sha256 "727b5c4f2f2fee5d6af6d8e91881c1887c270e84d0f115694bdb045484005061"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.7/ctx-linux-arm64"
      sha256 "e0c343d595256c815c017b6eacf7421547fb19bdfe26c28e7a6ccf9dc41dde25"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.7/ctx-linux-amd64"
      sha256 "f32cae3ef98de5c915446e1eef6596cd5ba9eafcd732e92e275326d43dc4394b"
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
