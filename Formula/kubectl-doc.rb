class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.0/kubectl-doc-v0.2.0-darwin-arm64.tar.gz"
      sha256 "708a5813db86c9ac1de0191b54338922fcfd67c539e9f9e716d8ef11514f4480"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.0/kubectl-doc-v0.2.0-darwin-amd64.tar.gz"
      sha256 "12a772d7cc67ef33b0d71a36fe876e2d30280e759930aa3b373e28b7baab96e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.0/kubectl-doc-v0.2.0-linux-arm64.tar.gz"
      sha256 "4cf394f1edc7748b65eca8cc8eac4038d22917b72600a1c72ac8a0d79b4de388"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.0/kubectl-doc-v0.2.0-linux-amd64.tar.gz"
      sha256 "bf8c5876a50845993c9f702d6c3236d75366c68ff1d6e0463fa4c9ee352ac8ba"
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
