class Chop < Formula
  desc "CLI output compressor for Claude Code"
  homepage "https://getchop.run"
  version "1.32.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.32.1/chop-darwin-arm64"
      sha256 "caaed7174756a08cfbc4606b261fbcdd102468ce3352945fd7acd4215d428f0f"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.32.1/chop-darwin-amd64"
      sha256 "860948c5b1a060b64af04a1030d0fd605a25e8e1c98bd98efd0c9d2dbb106e5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/chop/releases/download/v1.32.1/chop-linux-arm64"
      sha256 "7ea4b9aa05360ea67df82ee44cec88d633358bde8399708921c22ba393b9e259"
    else
      url "https://github.com/AgusRdz/chop/releases/download/v1.32.1/chop-linux-amd64"
      sha256 "1ffa7a6dc50647edfa9b2633bf28c021383a11e638bfc03ac750e7450a51860e"
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
