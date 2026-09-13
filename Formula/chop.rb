class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.39.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.0/chop-darwin-arm64"
      sha256 "c3d4a05159e6892b0502687b6ec54c0224b969adfcaa9cd81d55913674912df8"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.0/chop-darwin-amd64"
      sha256 "8e3bf08a55bc9966530e88144616463b3c79ea9e04a5b28b2e548de8bfa6b977"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.0/chop-linux-arm64"
      sha256 "159449defcfa1320bec16f738ece8af0137ac6c791e014a762630cc4a0c57b69"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.0/chop-linux-amd64"
      sha256 "a5377f7c3125d322e1e4d1bfc7dc7ed5014b9b87921eef6b48f69ca4c1512285"
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
