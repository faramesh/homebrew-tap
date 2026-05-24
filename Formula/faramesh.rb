class Faramesh < Formula
  desc "Unified governance plane for AI agents — pre-execution authorization, policy-as-code, tamper-evident audit trail"
  homepage "https://faramesh.dev"
  version "0.8.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-darwin-arm64"
      sha256 "cc153f7f0c39f0e688a62264dea4ab96444b10ff646f2a7e4307dd2d43b8033d"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-darwin-amd64"
      sha256 "f26c4d7a747bcd3e1f4d5f21ed511aa6176e47f8fdf5655159db4cbcc7e16144"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-linux-arm64"
      sha256 "c99199a28b095ea3b026295fe64731f3b898892f2210fbf206859fdc3711842e"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-linux-amd64"
      sha256 "2a05bc408fe173ef87f37cd7309d5014a579f7aa46d74ee933e7d7639509043d"
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
