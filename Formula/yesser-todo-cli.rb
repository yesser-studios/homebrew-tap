class YesserTodoCli < Formula
  desc "Todo CLI written in rust"
  homepage "https://github.com/Yesser-Studios/rust-todo"
  url "https://github.com/Yesser-Studios/yesser-todo-cli/archive/refs/tags/1.0.1.tar.gz"
  sha256 "04e9d7d36237049a38e53ac2cb763dfb80e5ee82cd7c270964bfe6aeefcb4341"
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
