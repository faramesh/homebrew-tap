class Faramesh < Formula
  desc "Unified governance plane for AI agents — pre-execution authorization, policy-as-code, tamper-evident audit trail"
  homepage "https://faramesh.dev"
  version "0.7.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-darwin-arm64"
      sha256 "8c1f44e200507a81472ef0c6e565540a364bc0cde2a08974f084dc859bbb526d"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-darwin-amd64"
      sha256 "dd95cadd82f1d7b74ef7fd735a002ddfd101803b98b0857f650a2c1d759922e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-linux-arm64"
      sha256 "54b85b798e0b0652611784f5d7ecb4998a0e4999c1565251ce29a739aae83eb9"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-linux-amd64"
      sha256 "f9d7a1e9d56fc22456075ec57e29166cd32eb4ea21090da9e47c2c7ac10158dd"
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
