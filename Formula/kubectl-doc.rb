class KubectlDoc < Formula
  desc "Render Kubernetes API documentation"
  homepage "https://github.com/sttts/kubectl-doc"
  version "0.2.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.7/kubectl-doc-v0.2.7-darwin-arm64.tar.gz"
      sha256 "2233c9cf90f4a3ac5645a25122343d791777a2b2df989966328bd1c5e344515e"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.7/kubectl-doc-v0.2.7-darwin-amd64.tar.gz"
      sha256 "1a4649e4ddb104ca62487308a64e3cd05169fec65722881a768d6450a2c55cf9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.7/kubectl-doc-v0.2.7-linux-arm64.tar.gz"
      sha256 "7ce8acff4187ad250f353acf25b17c423a802327d9385898952646d3ebb314e0"
    else
      url "https://github.com/sttts/kubectl-doc/releases/download/v0.2.7/kubectl-doc-v0.2.7-linux-amd64.tar.gz"
      sha256 "330b8cd96422ae06b79d347d4bda61aca3f66611a51df29b50d0c18d76d3bf40"
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
