class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.25.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.25.2/chop-darwin-arm64"
      sha256 "85eb94f6f30482be674dba1cd48b9f209f7c6332449ff545a345121a152570b9"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.25.2/chop-darwin-amd64"
      sha256 "229c5a21ade89caa19bf447b88101e9027d0536fe93adb2004735e4b6896144e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.25.2/chop-linux-arm64"
      sha256 "d5dcafb5efe4f4bda460c520821c03a4cfafede603c4ed5ffef71876dde74631"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.25.2/chop-linux-amd64"
      sha256 "ab19d863390274469128dc8d70ab3b778048ecbc9e2f9999812dde7838daa1e1"
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
