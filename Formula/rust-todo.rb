class RustTodo < Formula
  desc "Todo CLI written in rust"
  homepage "https://github.com/Yesser-Studios/rust-todo"
  url "https://github.com/Yesser-Studios/rust-todo/archive/refs/tags/1.0.0.tar.gz"
  sha256 "d42adbad710e68e2fa2689f068e35223826d222612cd990cf743bead5fca5dff"
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
