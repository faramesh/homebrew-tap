class Faramesh < Formula
  desc "Unified governance plane for AI agents — pre-execution authorization, policy-as-code, tamper-evident audit trail"
  homepage "https://faramesh.dev"
  version "0.3.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-darwin-arm64"
      sha256 "a03f19e1c18f3a30c780c15305d579af80734827f3eed383634265ba6606d0d1"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-darwin-amd64"
      sha256 "fb17ea80a403d858298f1107b11e589f12bbcf5771401832ae7b68cf3e7dd7ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-linux-arm64"
      sha256 "609e9a71facfacdb5d9758a2b5195429540e6da5b61e87d8591167224a97674f"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-linux-amd64"
      sha256 "c022c565fc2261bf0ec036f2f06c8c564356019834364d57ba0792fbc41e5257"
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
