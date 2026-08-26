class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.9/chop-darwin-arm64"
      sha256 "4e1fb924d6179a4536e2dbcc7776c29d8c8daf38c2679afeee4d8065ed50a232"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.9/chop-darwin-amd64"
      sha256 "bd87d2eddecb09ec148286f300e8c7f8b1762b0375ca7feac9ae4f248669c83a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.9/chop-linux-arm64"
      sha256 "424e8075d677cb689d7fbd550e70eafb52166323a3a7add6de6b4fb7a056a54e"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.9/chop-linux-amd64"
      sha256 "0c0bb98f7a3ac2e0cf11f62f71e7b845bfcdfbb29b49057d10b7fa54d4c2e077"
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
