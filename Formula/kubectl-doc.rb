class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.1/kubectl-doc-v0.2.1-darwin-arm64.tar.gz"
      sha256 "d03dbf68d13ed3e9e2ac4fc93d39b7616eede29ea25efe46faad388174f46160"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.1/kubectl-doc-v0.2.1-darwin-amd64.tar.gz"
      sha256 "41a6dccaf865ade245114ca0b9129054d6c8cbb73ef85ab2c385b1289cec4ef2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.1/kubectl-doc-v0.2.1-linux-arm64.tar.gz"
      sha256 "c39b377769ba36efb97bd87089f321e9ea78e674b5f3582a2b2d5df57485a0e3"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.1/kubectl-doc-v0.2.1-linux-amd64.tar.gz"
      sha256 "feecb80203adde21b92d2d23a3d4a88e24bb6c7ebd65fccf5d6581c13e527c17"
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
