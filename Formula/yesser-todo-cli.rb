class YesserTodoCli < Formula
  desc "Todo CLI written in rust"
  homepage "https://github.com/Yesser-Studios/rust-todo"
  url "https://github.com/Yesser-Studios/yesser-todo-cli/archive/refs/tags/1.1.0.tar.gz"
  sha256 "0d4f513299b5f875bfed2c657cd6efdf33ddeb514ecc5bd2224bdcdfb16a525f"
  license "MIT"

  bottle do
    root_url "https://github.com/yesser-studios/yesser-todo-cli/releases/download/1.1.0"
    rebuild 0
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0d18192b2ced6d0fb7113c6ed1400d11eaa2a89690bf8874c7cccfb8f0a5d712"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "42f5d59e071185163f157903cdaad1be196c769e6006d273344accbf0020e3cc"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate bin/"todo", :exist?
    assert_predicate bin/"todo", :executable?

    output = shell_output("#{bin}/todo -V")
    assert_match "todo 1.1.0", output
  end
end
