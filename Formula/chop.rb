class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.25.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.25.0/chop-darwin-arm64"
      sha256 "fc07d9317213c7922a28bb9b40ef4cec0c6fece57ef00add44333fe6bf45f26a"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.25.0/chop-darwin-amd64"
      sha256 "a0e4ce921c4160ebc796da5fe66ba1ea33eb6b38788c187763301ca313cdd575"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.25.0/chop-linux-arm64"
      sha256 "80859d8a060511bd5d6bf97a42a0767b50c51cf5348529e348a9859f7d592684"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.25.0/chop-linux-amd64"
      sha256 "8a0c933eccd353fb15a954f5f49ef93b02b9e2d9ba5167cfce9bda0cf5fbb03b"
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
