class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.37.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.37.0/chop-darwin-arm64"
      sha256 "fd25de78f40f4327d1c5e3df919c34ef1af5a68b69caa86f7df6cba98e56353a"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.37.0/chop-darwin-amd64"
      sha256 "7febffc512ce29ef4a62e20546cbde4c716febd96501e219a2941a3e10213458"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.37.0/chop-linux-arm64"
      sha256 "1d08ea1042b9ca99868280244b1e45ecff36bfc083881ef3229fae7e15860860"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.37.0/chop-linux-amd64"
      sha256 "d02d0bdb57dedd827e13c532f0cea3ebfbfe28f26a14de40a2d4d3a7264ee8d0"
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
