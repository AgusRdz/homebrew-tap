class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.39.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.2/chop-darwin-arm64"
      sha256 "61503c7736b1c7dd294e48a59ad22bd617da4f2bbb6431b8a6b759988c9e21a8"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.2/chop-darwin-amd64"
      sha256 "eda312082a6896090b834185a21f4c66b379a99d28ff4c1d96ef02d0dd8ec03b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.2/chop-linux-arm64"
      sha256 "0a351c2d38750eac30c01e87d0a5030ec90523d97b2d701786d74cb2551f85dd"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.2/chop-linux-amd64"
      sha256 "abc5f389fa268fd797aef6357ffc67d766eaef033eff4a10fd76697c918b0414"
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
