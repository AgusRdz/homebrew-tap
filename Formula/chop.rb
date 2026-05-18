class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.6/chop-darwin-arm64"
      sha256 "235f960bd74249f3fd7ec839b3217838fbc0fde0f5835a446718a18c35957255"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.6/chop-darwin-amd64"
      sha256 "44551d3c576f811c260cb44fd6756e9c542656c2d24ae7076030cc97b4ea0733"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.6/chop-linux-arm64"
      sha256 "ce1d6d73eeebfa7d68d649e1c7d3cbbc9a9e1e33b297519e10cc583ccc86da2e"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.6/chop-linux-amd64"
      sha256 "778a4146692116464de695ebff7b747d40e4a1402fe93915007dbed5319a4ed8"
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
