class YesserTodoCli < Formula
  desc "Todo CLI written in rust"
  homepage "https://github.com/Yesser-Studios/rust-todo"
  url "https://github.com/Yesser-Studios/yesser-todo-cli/archive/refs/tags/1.0.2.tar.gz"
  sha256 "6f49f2bf14d2ccabb46a9d59c584089800d2c71e441904b6487c3fb5bdfb6170"
  license "MIT"

  bottle do
    root_url "https://github.com/yesser-studios/yesser-todo-cli/releases/download/1.0.2"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a10e64912ab0ebada1120778237ad573dbec96827debb44b5af728b42e89886c"
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
    assert_match "todo 1.0.0", output
  end
end
