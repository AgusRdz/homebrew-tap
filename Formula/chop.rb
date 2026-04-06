class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.1/chop-darwin-arm64"
      sha256 "a2c366166a93a0931f575b3d156475f32ae335187a4b9a2037efeadcfb8de4e4"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.1/chop-darwin-amd64"
      sha256 "d016a07907bf8d2d8c56261978e841cc57131210b3fef96db7872aff49fccd6b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.1/chop-linux-arm64"
      sha256 "806dd966c478f8a5890f86fadf641edd75b8304123627347a4416b2eeb74fdbf"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.1/chop-linux-amd64"
      sha256 "8c7a71d14dc4c439f9a47aff7ba4bd2c64ec160f8e5b2ca80863966bb50092c1"
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
