class Jf < Formula
  desc "The jf application"
  homepage "https://github.com/say4n/jf/"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/say4n/jf/releases/download/v0.1.0/jf-aarch64-apple-darwin.tar.gz"
      sha256 "ac39be084a9b38e2e722e681b94236fc4b7fd72ea320850fec21b6d4ef9981ab"
    end
    if Hardware::CPU.intel?
      url "https://github.com/say4n/jf/releases/download/v0.1.0/jf-x86_64-apple-darwin.tar.gz"
      sha256 "1bfab4b974f61d2e314f2414dedcc9fd1b850850350cff6e5499eaffe0f07dad"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/say4n/jf/releases/download/v0.1.0/jf-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2004edd6bebab37eee4d57e80df585dfef7634df5ff0d31928d0912c8e07dec"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "jf"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "jf"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "jf"
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
