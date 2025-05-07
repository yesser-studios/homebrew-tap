class YesserTodoCli < Formula
  desc "Todo CLI written in rust"
  homepage "https://github.com/Yesser-Studios/yesser-todo-cli"
  url "https://github.com/Yesser-Studios/yesser-todo-cli/archive/refs/tags/1.1.2.tar.gz"
  sha256 "812f4aec5d6d133ed18a31e03d56c567930c10540ecf9481cd032b04f4667a35"
  license "MIT"

  bottle do
    root_url "https://github.com/yesser-studios/yesser-todo-cli/releases/download/1.1.2"
    rebuild 1
    # sha256 cellar: :any_skip_relocation, arm64_sonoma: "a10e64912ab0ebada1120778237ad573dbec96827debb44b5af728b42e89886c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "eb2a4bd0493b7b613ab3e6e409171265a94d6aed745b56e190ecb70d43c60f96"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate bin/"todo", :exist?
    assert_predicate bin/"todo", :executable?

    output = shell_output("#{bin}/todo -V")
    assert_match "todo 1.1.2", output
  end
end
