class Faramesh < Formula
  desc "Unified governance plane for AI agents — pre-execution authorization, policy-as-code, tamper-evident audit trail"
  homepage "https://faramesh.dev"
  version "0.6.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-arm64"
      sha256 "1663e3fe5c3812a0b068a741603a4901eb5757d4eb11c8080fac8d8bc182c47f"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-amd64"
      sha256 "2159d399c8978955a0e483b8684811f8cd1fe611580ce20175f5486951b0669b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-arm64"
      sha256 "be6b3fad5808146ab0a0987ae2c0f0b84b15dcc3a4c78ea9b7563607e8f0bd94"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-amd64"
      sha256 "b36e4c9ffd37de70722303cb570dffd36b2f9c19ee3eb9ad7281434cb02865bd"
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
    assert_match version.to_s, shell_output("#{bin}/faramesh --version")
    system bin/"faramesh", "demo"
  end
end
