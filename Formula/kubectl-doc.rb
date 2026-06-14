class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.2.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.8/kubectl-doc-v0.2.8-darwin-arm64.tar.gz"
      sha256 "47f839349e1cc86c0c0b3de0306f20ca5c3f526b4fd09e35bf8270afa52edc9d"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.8/kubectl-doc-v0.2.8-darwin-amd64.tar.gz"
      sha256 "34c6a8152d4e80c5a5204107c240370c3d82cac629e80a94b6cf0d053af78013"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.8/kubectl-doc-v0.2.8-linux-arm64.tar.gz"
      sha256 "ac67419ee8bd1eba5325964b8e505a46e326d9a827d12583c04e8504daf49a29"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.8/kubectl-doc-v0.2.8-linux-amd64.tar.gz"
      sha256 "6725a92cb1cbbe27b1ea6a43deee17d4776816070c2900befad23615450fe5fa"
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
