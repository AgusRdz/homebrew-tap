class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.39.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.1/chop-darwin-arm64"
      sha256 "026b367f664e8eba12eced84417d0257c52f326a49048fc29163b7a89b55c5a0"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.1/chop-darwin-amd64"
      sha256 "68fac10a6b5d2d888d10437d57545ebdb77230d8668c830b0775e518010d3d4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.1/chop-linux-arm64"
      sha256 "0edc88b30b335376fce98089f05f952718db7b750b742ee38ab341aae656ef7f"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.39.1/chop-linux-amd64"
      sha256 "555a534ace969cd0cf50d4650d58bb2bdd9b22c3461b12da3f5f110c63701910"
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
