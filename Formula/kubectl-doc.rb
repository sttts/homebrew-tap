class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.7/kubectl-doc-v0.1.7-darwin-arm64.tar.gz"
      sha256 "f14dafb7176fe6a779e9d4881371076207189c4b34f0978b67afb335b81b9033"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.7/kubectl-doc-v0.1.7-darwin-amd64.tar.gz"
      sha256 "1bd361f2aefbe60cbdbf728dc10cc4c637dbe4adc1b4a07b4d6be55f59475e25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.7/kubectl-doc-v0.1.7-linux-arm64.tar.gz"
      sha256 "b2ffd381b655c0d1be21a9c5d5d28d4970033a8733152402ae56b68464ab0306"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.7/kubectl-doc-v0.1.7-linux-amd64.tar.gz"
      sha256 "f56e1eabaf5f5b361fe6416fd8336ad8f2c4dca45213cb06325394ab52883dcf"
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
