class Faramesh < Formula
  desc "Unified governance plane for AI agents — pre-execution authorization, policy-as-code, tamper-evident audit trail"
  homepage "https://faramesh.dev"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-arm64"
      sha256 "16e3958b480ab651c1841148d61a2de4ce903f6ab62aefe63095507135617202"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-amd64"
      sha256 "32e524d7d8ee6cee6f8b06a5aa36bffa18d4ab91ca6567ec881566e0f67f4325"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-arm64"
      sha256 "18c75ed11eef8e3fb02fb306240bf1f5765b930c3c2eb6c70c3c3c364f1860e7"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-amd64"
      sha256 "8aa402f09678e03b6ff39893972ec5ad1aefa90f4c8bccfd327d274bbe056010"
    end
  end

  def install
    bin.install Dir["faramesh-*"].first => "faramesh"
  end

  def caveats
    <<~EOS
      Run the demo to see Faramesh in action:
        faramesh demo

      Start the guided setup flow:
        faramesh setup flow

      Uninstall from a project and clean up local state:
        faramesh setup uninstall --path /path/to/project --yes

      Start the governance daemon:
        faramesh serve --policy policy.yaml

      Docs: https://faramesh.dev/docs
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/faramesh --version")
    shell_output("#{bin}/faramesh setup --help")
    system bin/"faramesh", "demo"
  end
end
