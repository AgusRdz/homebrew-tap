class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.34.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.34.1/chop-darwin-arm64"
      sha256 "75eedeea1e70a26cc447c403a2fbad374ee899f8947f6c65746cc85fc337b9ad"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.34.1/chop-darwin-amd64"
      sha256 "591ba64aa0d47e08b52744a998aee0f2f7854938a0694ff3e76a1c2843fe3993"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.34.1/chop-linux-arm64"
      sha256 "78e45a1e0aeffe496c1cd13d8b4d3ce4e85d12bacac80b68c811a96c14ae2daf"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.34.1/chop-linux-amd64"
      sha256 "1db1cd5d3f297bef8a05a7f5c04f334dea2eea88ea0c910bafeacea7c5a1ceb7"
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
