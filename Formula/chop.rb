class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.38.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.7/chop-darwin-arm64"
      sha256 "1dac85d8b9e6d1ae5071ae2a4c5b69363c930eb93a16619f17062c357cf44da1"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.7/chop-darwin-amd64"
      sha256 "c2e780b0e7dbb902907d609358bcbc231bdaebc87bbd2987f467e652975452b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.7/chop-linux-arm64"
      sha256 "90a17a4363940e29bcd9ddba3bd838a1e3696dd49a04d36b921e395f58cffbcd"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.38.7/chop-linux-amd64"
      sha256 "78fe0b31f4901f02a9f48acd2be158640245cdcc07c19551ec497c1115597188"
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
