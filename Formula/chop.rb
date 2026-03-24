class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.30.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.2/chop-darwin-arm64"
      sha256 "b0b1c91d344a53a5a6064da69dcd7a889252e880988da92e6ad88bb503016914"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.2/chop-darwin-amd64"
      sha256 "d4c7632ebbcfe5bb385cceebeca3cb05d25e3f302427d110cd2e7552ba27165f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.2/chop-linux-arm64"
      sha256 "55d3aa42815c822e73127a1ce156b864172e3feda8754a522289bc36c013e378"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.30.2/chop-linux-amd64"
      sha256 "9820b3047487de4b1a26e5db575061c29aa8d534c2f5316ccb59170db86543ec"
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
