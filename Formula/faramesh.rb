class Faramesh < Formula
  desc "Unified governance plane for AI agents — pre-execution authorization, policy-as-code, tamper-evident audit trail"
  homepage "https://faramesh.dev"
  version "1.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-arm64"
      sha256 "6d8008a05f745ed407e1f225ed58385dd445ab67c4c077d2fdf9c3a086d977ba"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-darwin-amd64"
      sha256 "ee2fcc1b22d739f0ccc686ea42c0b1fe5f3c3947bc13fd11576cb6f0635ad363"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-arm64"
      sha256 "3ae99110d75d43e503ea932192d165faee794312a7b64469d09f05ca1577929a"
    end
    on_intel do
      url "https://github.com/faramesh/faramesh-core/releases/download/v#{version}/faramesh-linux-amd64"
      sha256 "fb59cded883aba7ecf1f1affcb604166e36a81407f2bcc89565a6fc0f53928ac"
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
