class YesserTodoCli < Formula
  desc "Todo CLI written in rust"
  homepage "https://github.com/Yesser-Studios/rust-todo"
  url "https://github.com/Yesser-Studios/yesser-todo-cli/archive/refs/tags/1.0.2.tar.gz"
  sha256 "6f49f2bf14d2ccabb46a9d59c584089800d2c71e441904b6487c3fb5bdfb6170"
  license "MIT"

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
