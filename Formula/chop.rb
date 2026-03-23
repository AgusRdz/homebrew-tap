class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.30.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.0/chop-darwin-arm64"
      sha256 "f23039234a8e1439a577d3ce6db53f5e6659a98d5ecf8c432d2602a63e266c51"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.0/chop-darwin-amd64"
      sha256 "43e5d0fc2a434fcf18f740839ef182a4c0b58beeaa16aa7306329bf8bd1a0e1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.0/chop-linux-arm64"
      sha256 "e922b31c4547d7f1ead21313a4015466c46c6e7251b16af41deedc13ca7472a4"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.0/chop-linux-amd64"
      sha256 "55a4b0d2299334f05193373c223c0371f2ce4aca350e6a82b794a0b3f1c4d86c"
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
