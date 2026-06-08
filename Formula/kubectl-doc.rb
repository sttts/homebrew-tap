class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.2/kubectl-doc-v0.2.2-darwin-arm64.tar.gz"
      sha256 "7daaa1afb98f6c213ca6e74768926bfda1ef1bdb451c8d3aac03c07833952dc2"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.2/kubectl-doc-v0.2.2-darwin-amd64.tar.gz"
      sha256 "3f880e049b1d8b7159cc9142c69ae8b931c063309e9f42473275b405a568b026"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.2/kubectl-doc-v0.2.2-linux-arm64.tar.gz"
      sha256 "4cdfd9faf243f6060631a2875cfdd461912192132d8cfc3123e0a3ee696628ac"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.2/kubectl-doc-v0.2.2-linux-amd64.tar.gz"
      sha256 "308e21eab0b900f2cd5bc46240134100c1323f0eafdce60acefab1996aea0404"
    end
  end

  def install
    bin.install Dir["kubectl-doc", "kubectl-doc-*/kubectl-doc"].first => "kubectl-doc"

    license_file = Dir["LICENSE", "kubectl-doc-*/LICENSE"].first
    doc.install license_file if license_file
  end

  test do
    assert_match "kubectl-doc", shell_output("#{bin}/kubectl-doc --help")
  end
end
