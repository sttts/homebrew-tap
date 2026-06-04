class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.2/kubectl-doc-v0.1.2-darwin-arm64.tar.gz"
      sha256 "69300cbebce8f9bd8a576374e0fae9fbf04705a3e3219e37c77c7abc07e9b7b5"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.2/kubectl-doc-v0.1.2-darwin-amd64.tar.gz"
      sha256 "bb08599477299d3cd808bdc92a72b1dbdd6bd2ff37c11c5609f80131dfab7796"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.2/kubectl-doc-v0.1.2-linux-arm64.tar.gz"
      sha256 "288759a8751f7c4f61cf3842a4ad5515abcb363d3d44e003ac1931df65a4ca4e"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.2/kubectl-doc-v0.1.2-linux-amd64.tar.gz"
      sha256 "e14b912a5e40f7bcb4cba9fbb7ecc1678c46cd60373e81734c27fc1bd7e90ee2"
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
