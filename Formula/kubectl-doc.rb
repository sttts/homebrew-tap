class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.4/kubectl-doc-v0.1.4-darwin-arm64.tar.gz"
      sha256 "a7b4c271953bddef82bfd78af6917444688725d220c08344e6fa58b504c78059"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.4/kubectl-doc-v0.1.4-darwin-amd64.tar.gz"
      sha256 "ac29d40b5ef2ed101f186b28eafa184b900089a276c6daf65b045c88748225ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.4/kubectl-doc-v0.1.4-linux-arm64.tar.gz"
      sha256 "ff942f2073d3158b0b961ccaa02342d2f9743db48e2d0d57a7526744213e98db"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.1.4/kubectl-doc-v0.1.4-linux-amd64.tar.gz"
      sha256 "f76be82143a5d3ffb81e1da0a53d0aa2608a7a14b9badc7443c0f055fdda5f51"
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
