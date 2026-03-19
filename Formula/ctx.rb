class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.2/ctx-darwin-arm64"
      sha256 "31459af698d518afd5836ff6d81d955327ef3595c568c646651f197e0b7fb9fe"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.2/ctx-darwin-amd64"
      sha256 "9c191e34f4b6ffe89fba1036156ac6c3e39ec6756648c040589e6daaabcc0065"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.2/ctx-linux-arm64"
      sha256 "528a060cfd47520031e1fd58dcc133900020bab203f913651ab46171c96f4d11"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.2/ctx-linux-amd64"
      sha256 "c59e9ffc655ee9e087d8a43d533013c459870f864090173133275b6702aa1755"
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
