class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.2.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.5/kubectl-doc-v0.2.5-darwin-arm64.tar.gz"
      sha256 "076fd9460fa1ec2af7f809216482f22091f3460da23784d9c3df255e22a1f875"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.5/kubectl-doc-v0.2.5-darwin-amd64.tar.gz"
      sha256 "60df275e4b9169f6ad2e50b5e088fcb226f6f62878a1683e88445ad3e011b5bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.5/kubectl-doc-v0.2.5-linux-arm64.tar.gz"
      sha256 "092ec76ffe34f4e4d4593bb3df32e46562e84582bb5570b62c166e0317014d5b"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.5/kubectl-doc-v0.2.5-linux-amd64.tar.gz"
      sha256 "7096be2785e20d306e6182f39a42aeaf5ab387253fd50cfc4577768fb5154cd4"
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
