class Faramesh < Formula
  desc "Unified governance plane for AI agents — pre-execution authorization, policy-as-code, tamper-evident audit trail"
  homepage "https://faramesh.dev"
  version "0.1.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-darwin-arm64"
      sha256 "175a1c80c28e0d638f1b02d0c95102fbf80e436eb84386a3e5ed0a0b88692225"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-darwin-amd64"
      sha256 "412463df984158d091921655307ee0df92f422b8c66a95175ff319216ed40d25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-linux-arm64"
      sha256 "55087e0785ab29189294d4e53913d5598586e0b6441b62ac1bf888f7243fd018"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-linux-amd64"
      sha256 "842b8d26794b5e1f3c9b36a981e173bbc73625c4506ab67d9dfa66e43472c979"
    end
  end

  def install
    bin.install Dir["faramesh-*"].first => "faramesh"
  end

  def caveats
    <<~EOS
      Run the demo to see Faramesh in action:
        faramesh demo

      Initialize Faramesh in your project:
        faramesh init

      Start the governance daemon:
        faramesh serve --policy policy.yaml

      Docs: https://faramesh.dev/docs
    EOS
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/faramesh --version")
    system bin/"faramesh", "demo"
  end
end
