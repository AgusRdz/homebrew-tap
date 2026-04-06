class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.36.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.36.0/chop-darwin-arm64"
      sha256 "d6f40ec877472b25963a61b09631a08484cc7fac8fa32ee3e2eb105bace7f2e6"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.36.0/chop-darwin-amd64"
      sha256 "c8171d892b30ce91a7a43649b6bd5aac5902afa7b9ad3d13ef4fe8bd4b5b6ea6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.36.0/chop-linux-arm64"
      sha256 "f027090013fb5bfb044f79ea6e1411607bea9355e3765c0d6f9b1c7b0be24107"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.36.0/chop-linux-amd64"
      sha256 "edcdf0b7ef27e36ab6a5fd58947fa98f74f58c7099f399bba1e039c3a9d24e94"
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
