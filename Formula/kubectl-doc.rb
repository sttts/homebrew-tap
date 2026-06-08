class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.2.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.4/kubectl-doc-v0.2.4-darwin-arm64.tar.gz"
      sha256 "51c3e63b80d2795bd79b82344aa3417923c3624aec250e421b2a0d83d62f97c5"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.4/kubectl-doc-v0.2.4-darwin-amd64.tar.gz"
      sha256 "e78118f4a405eee671bd132456b06be9e6d09931347a6fb3da1bdc308e560c5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.4/kubectl-doc-v0.2.4-linux-arm64.tar.gz"
      sha256 "0d01833c711342162d521613e41669fab6c6feae92a0ad79ca17fc5fcc62fe9b"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.4/kubectl-doc-v0.2.4-linux-amd64.tar.gz"
      sha256 "92600c09771d7cb75c60c9ff719817d302c464a82e17e07c827ce245775c66ec"
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
