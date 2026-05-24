class Faramesh < Formula
  desc "Unified governance plane for AI agents — pre-execution authorization, policy-as-code, tamper-evident audit trail"
  homepage "https://faramesh.dev"
  version "0.1.0"
  license "MPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-arm64"
      sha256 "3d9260c5ce2c5db7a8c2f4923ff0b26b62ef9f1df5c3f2e2081bfcd205c97d71"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-amd64"
      sha256 "5e4709b85c2d6c99b23da9ef93e9d7aaf015a44e4a188b892249b1b4b2983c61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-arm64"
      sha256 "043f9d03a3c943ccd9ff88c4ed315bcf2c148bde2b96da5f728818f70dd51ff9"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-amd64"
      sha256 "b16af546c0ba173e8c36a9ad8a2e958522bd8fe199857022bf13590bf4ebfef1"
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
