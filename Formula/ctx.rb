class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.6.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.1/ctx-darwin-arm64"
      sha256 "b0441b17465cbfd873ec8a427bc63bb254f25b56836a16aee9d3905b171bea9c"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.1/ctx-darwin-amd64"
      sha256 "09e98eb224810a8bea9f9d8e4db9cc06b5ee74caa848176784546c62fef7516e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.1/ctx-linux-arm64"
      sha256 "d393302dc22285b4fdd3e1022dba7ab86d8d8e9014d1e44cfa2d5a9ea1108f89"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.1/ctx-linux-amd64"
      sha256 "bc19f66994d3149f4f48be7397ef003d806afbf0f57f5506bcd2f95adfb1710f"
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
