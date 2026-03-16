class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.1/ctx-darwin-arm64"
      sha256 "da497ab20b419bd2542f233edafbbb4480b1544db9144f683c91761ec8be1744"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.1/ctx-darwin-amd64"
      sha256 "a460c326fb045f6014dd063e91dbb8682f0f73e055838f03a5a0a4a519571a4d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.1/ctx-linux-arm64"
      sha256 "dcb3e786f0540806afa18945a1be591590066809df26d2dccd39a630e8b40dfd"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v0.7.1/ctx-linux-amd64"
      sha256 "72b12413231f464230cdc89cadd91775b277cf8e7f6938740bcef9de13e17430"
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
