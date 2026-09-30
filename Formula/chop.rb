class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.39.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.3/chop-darwin-arm64"
      sha256 "377bceb00c1cdce869899e5c0c813bf8008774fa42672729264a1e3869eb09fe"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.3/chop-darwin-amd64"
      sha256 "368dde469abefa49afc48124689c96c1ebc2f76393bdd17a23469940495ee050"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.3/chop-linux-arm64"
      sha256 "d198c3c04ed647cf99b4a18219f2efa534c92a12bcdd0225432ed7e0d3d68ee8"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.3/chop-linux-amd64"
      sha256 "4ae49e98a2685e7e7d42fcb9f81e926b36c4a77dbf7da5abb7a93ac6fc656263"
    end
  end

  def install
    binary = Dir["chop-*"].first
    chmod 0755, binary
    bin.install binary => "chop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chop --version")
  end
end
