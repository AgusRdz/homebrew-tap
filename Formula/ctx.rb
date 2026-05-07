class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.6.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.3/ctx-darwin-arm64"
      sha256 "ca62beed1f051bf82048c979445790535a569191f2919e9568b3c78be64cc43f"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.3/ctx-darwin-amd64"
      sha256 "fa51559a2c294d502c92f82812ebc97adeae52916e2275cc17184ce4ecca831b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.3/ctx-linux-arm64"
      sha256 "3a5b6be63d068ac43a91564d10dc160e6ee8535baa22397748aa19df6f7ac942"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.6.3/ctx-linux-amd64"
      sha256 "a03df7927fdd710b7485146764831c3c1caf2b084bfc12d770f98754281dcc1d"
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
