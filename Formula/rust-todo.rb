class RustTodo < Formula
  desc "Todo CLI written in rust"
  homepage "https://github.com/Yesser-Studios/rust-todo"
  url "https://github.com/Yesser-Studios/rust-todo/archive/refs/tags/1.0.0.tar.gz"
  sha256 "d42adbad710e68e2fa2689f068e35223826d222612cd990cf743bead5fca5dff"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/todo"
  end

  test do
    
    system "false"
  end
end