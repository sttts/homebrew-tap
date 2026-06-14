class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.2.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.9/kubectl-doc-v0.2.9-darwin-arm64.tar.gz"
      sha256 "41a474c74c8bd155756c54f43af6601bb6f4a8e1b1bfeca7b9f5b12241910867"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.9/kubectl-doc-v0.2.9-darwin-amd64.tar.gz"
      sha256 "96d203332de8ccf24ae82f82514bc8503d1f5951b369c54c70439a2cafd36036"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.9/kubectl-doc-v0.2.9-linux-arm64.tar.gz"
      sha256 "e1773ea42eb58df046e701e0371bb8c06864c91097e1c67392c9b5d13c236ee3"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.9/kubectl-doc-v0.2.9-linux-amd64.tar.gz"
      sha256 "a8483cfcaa9f65c655712366dec05ca1e7cc2b4d1a91f89fd82fe5ebe5e7067e"
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
