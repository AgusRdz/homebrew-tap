class Ctx < Formula
  desc "Preserve and restore Claude Code session context across compactions"
  homepage "https://github.com/AgusRdz/ctx"
  version "1.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.4/ctx-darwin-arm64"
      sha256 "c6f2da8747cf0fe44efa761f0fda81b90fb36ab76224a806f683eb1d6f25c432"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.4/ctx-darwin-amd64"
      sha256 "1e93fafdf39f911a824f816c27dade7a2e2f0145cecf577245ddd9386eb9278e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.4/ctx-linux-arm64"
      sha256 "3b5e821af54c4d5f8f7b0e9637937dca7a81b02191a55cfcc5f19583445078d0"
    else
      url "https://github.com/AgusRdz/ctx/releases/download/v1.1.4/ctx-linux-amd64"
      sha256 "165e97d7e4c55b39b947b9d18a98b3176c8951b4832dd6e4ac1e1e0b73abf89e"
    end
  end

  def install
    binary = Dir["ctx-*"].first
    chmod 0755, binary
    bin.install binary => "ctx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ctx --version")
  end
end
