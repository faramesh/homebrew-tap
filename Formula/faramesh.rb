class Faramesh < Formula
  desc "Unified governance plane for AI agents — pre-execution authorization, policy-as-code, tamper-evident audit trail"
  homepage "https://faramesh.dev"
  version "1.2.1"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-arm64"
      sha256 "1aa27b69d84d10bf6132a0dea99276a79e218421aeb10b602cb51e30b8425b6d"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-amd64"
      sha256 "c325b1d8561c2c8807bd81b21a971d653daf081807a41a09662509107ddfadc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-arm64"
      sha256 "3c25e672fffeecc56b857527fc718767bb91114f9a94fb1b77f0ec30f66fd73e"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-amd64"
      sha256 "f954e1d0057168c737d09e0039f0f35f7faa17e2458daec28fe99ed9f8ae8f81"
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
