class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.5/kubectl-doc-v0.1.5-darwin-arm64.tar.gz"
      sha256 "02d77fed69467a6c77ca1f742de6e6ba1173f95322170c79283a11a985dd2717"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.5/kubectl-doc-v0.1.5-darwin-amd64.tar.gz"
      sha256 "053af41b0ab29147ad0bdbac6ed04e2bd17df4f6f1f3653b9212a632389e59ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.5/kubectl-doc-v0.1.5-linux-arm64.tar.gz"
      sha256 "23d64a294e247fe73f8be840856ba645760a5f9c324f52c5d80bf42a26f6af25"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.5/kubectl-doc-v0.1.5-linux-amd64.tar.gz"
      sha256 "1a031938db9f5a2edd9a02ef8d204c3787cc961de41e06c9f01f65de8a5ea18e"
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
