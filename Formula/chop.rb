class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.11/chop-darwin-arm64"
      sha256 "16cb334ce3f0f81cb868456ae9932abdb45ee571cfbbba0241b7815a38b6bfca"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.11/chop-darwin-amd64"
      sha256 "5d987ada5224dd29da4d770d6f15ba261b349bf31a7496c5aa93b56fb41a23d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.11/chop-linux-arm64"
      sha256 "801266effd737c737c2ea79eaf254e396562cba9563acdf74b5da13c04ec679f"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.11/chop-linux-amd64"
      sha256 "64e4da901456bdd4cd9baefe0f7333e010ee262f40024079e3a3868678edbde1"
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
