class Faramesh < Formula
  desc "Governance plane for AI agents"
  homepage "https://faramesh.dev"
  version "0.2.0"
  license "MPL-2.0"

  livecheck do
    url :url
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-arm64"
      sha256 "6b89acce83e1b7dcbd3079f50c4762dc2657886413e3e3262d23f8d144a9ea24"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-amd64"
      sha256 "3febb4b39cb1cdad7dc1bec098394ef86711ff15510a5f5197fadb386c2c2020"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-arm64"
      sha256 "316f92764546763c56840287cb1f94393637b93726e3b57cd552c6f009f57222"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-amd64"
      sha256 "d95c739252957c1059e58a66d52b74262562ff7a8c43812e03e34755df650ed9"
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
