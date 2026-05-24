class Faramesh < Formula
  desc "Unified governance plane for AI agents — pre-execution authorization, policy-as-code, tamper-evident audit trail"
  homepage "https://faramesh.dev"
  version "0.9.0"
  license "MPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-arm64"
      sha256 "6f7496dfccd9f6d781768c5f761113ed55061b09af653d3ad35a94d7ce632e48"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-amd64"
      sha256 "4b788064fc854ecb7d72293bd34d239d85538789dfbe6346d8c7329b0f2297a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-arm64"
      sha256 "0cedebcb959ab62599392a932243ff1e0ed5275d289c83f2173fe1900cf1f29c"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-amd64"
      sha256 "8b5f77cb898559300548ac642a28f2e244d0938191687bd8365d33d44e95b2fb"
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
