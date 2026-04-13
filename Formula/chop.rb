class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.4/chop-darwin-arm64"
      sha256 "66b179661b80e668405ed3b6e84c62c61398ceeeafed7a04ab653c0c0140fe63"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.4/chop-darwin-amd64"
      sha256 "9b394c5770e54d395cdcbe6da36978c9f900332e385a87aff3367e07c0eacbae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.4/chop-linux-arm64"
      sha256 "2d2e9f19b55bc4a24f7f4708f9331f51424270f63a6b2ca613c5f8f278a0f830"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.4/chop-linux-amd64"
      sha256 "e2768dd1f0e03c884dc547eded3d4a069009f7cc4ca1e151ef499be2dd849879"
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
