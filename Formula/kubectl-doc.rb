class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.6/kubectl-doc-v0.1.6-darwin-arm64.tar.gz"
      sha256 "723e039b171c05e8843e5eb68630196e7e49ddc930f73545d89e54eb862828ff"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.6/kubectl-doc-v0.1.6-darwin-amd64.tar.gz"
      sha256 "fac25843c0058d6e120a9f01b4329f94745ec1b1501307a85d40a99ba3752181"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.6/kubectl-doc-v0.1.6-linux-arm64.tar.gz"
      sha256 "a4a76a21ee260d5d9fee7322ed1ed45d9b3019345279095b803b691f952b2129"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.6/kubectl-doc-v0.1.6-linux-amd64.tar.gz"
      sha256 "315b2d203b6a7450d286c0bdc156ef2f15987e06caad96733369e4341439d8f7"
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
