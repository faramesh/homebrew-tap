class Faramesh < Formula
  desc "Unified governance plane for AI agents — pre-execution authorization, policy-as-code, tamper-evident audit trail"
  homepage "https://faramesh.dev"
  version "0.2.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-darwin-arm64"
      sha256 "eb23886d855bfcc01feb93b783d4acf81055a6442818103357384d85e902865e"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-darwin-amd64"
      sha256 "faef3466747bc445ca5854ed5fad044d2bb610727973f681a6570a32f119d54c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-linux-arm64"
      sha256 "0d307b7927d6f14ebd1320d018cc5946e692c2818380229dd4f3ab9179c6fa2e"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v\#{version}/faramesh-linux-amd64"
      sha256 "7d2be07d1c66356fecec07634f74547734559c74671ce9767103cea230b323e6"
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
