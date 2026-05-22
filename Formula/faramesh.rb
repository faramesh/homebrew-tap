class Faramesh < Formula
  desc "Governance plane for AI agents"
  homepage "https://faramesh.dev"
  version "1.2.9"
  license "MPL-2.0"

  livecheck do
    url :url
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-arm64"
      sha256 "aa525042049cd247b98b9bb6d3aa68977cd1ab54872886aa343f7a48f6942b03"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-amd64"
      sha256 "ca458a70681886ba063d9410e9d5a1897ace01041ad30f9ddd7264fc949a3caa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-arm64"
      sha256 "6461b3b61247f33a6fe322ada50f2082c810574960ae38b6daf362683a09ff43"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-amd64"
      sha256 "338dd0da50f9fb7045f5a60be7adc29444272e5ec9ec887e65085fca027a914f"
    end
  end

  def install
    bin.install Dir["faramesh-*"].first => "faramesh"
  end

  def caveats
    <<~EOS
      Zero-infrastructure local governance:
        faramesh init
        faramesh dev
        .faramesh/bin/agent -- python your_agent.py

      Production:
        faramesh apply

      Docs: https://docs.faramesh.dev
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/faramesh --version")
    shell_output("#{bin}/faramesh init --help")
    shell_output("#{bin}/faramesh apply --help")
  end
end
