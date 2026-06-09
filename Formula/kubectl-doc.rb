class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.2.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.6/kubectl-doc-v0.2.6-darwin-arm64.tar.gz"
      sha256 "8022a521a17897dab669ff0528bdb2d7b078f4e334334d265ec970f312cbd522"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.6/kubectl-doc-v0.2.6-darwin-amd64.tar.gz"
      sha256 "69a8bcc8d1a2f92264269bde919dcb263255d903f4f1d9c4d0cd634615e7d7d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.6/kubectl-doc-v0.2.6-linux-arm64.tar.gz"
      sha256 "7914795c0c9007e547774c2563a4d43359b118c734c79d7bb1b5ec76e86936f0"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.6/kubectl-doc-v0.2.6-linux-amd64.tar.gz"
      sha256 "2afc015de978a2a2060f350b1292c1dedee39fbf590c0da7e829f7d36a71cf7d"
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
