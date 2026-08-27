class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.10/chop-darwin-arm64"
      sha256 "56bceb2e55cfe859ac3db8c11c0edf3e1f9a18a6fe32ebee899a36ddfed00168"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.10/chop-darwin-amd64"
      sha256 "0ef894f692f40b1865cd504b402f5bd38096ac6faa0e095a3fae91548097fc00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.10/chop-linux-arm64"
      sha256 "8b3ee79e817a989172a86a1dd0dcf80371a1cc45fb767ba3518ca8f2fd633372"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.10/chop-linux-amd64"
      sha256 "1acdfefbe17bc5e2f11f33721283ba5b373125e1f46b129d5394469d2d8db2a0"
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
