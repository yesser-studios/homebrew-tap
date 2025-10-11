class YesserTodoCli < Formula
  desc "Todo CLI written in rust"
  homepage "https://github.com/Yesser-Studios/yesser-todo-cli"
  url "https://github.com/Yesser-Studios/yesser-todo-cli/archive/refs/tags/1.2.0.tar.gz"
  sha256 "308396c5d31907131c985c944ba67fa8e9b96b986a450e009c990a4d98749703"
  license "MIT"

  bottle do
    root_url "https://github.com/yesser-studios/yesser-todo-cli/releases/download/1.2.0"
    rebuild 2
    # sha256 cellar: :any_skip_relocation, arm64_sonoma: "a10e64912ab0ebada1120778237ad573dbec96827debb44b5af728b42e89886c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5698f79b914bd115b3a866e5ba3613a3b9b43d21c120e1766e7c26b14f247c23"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_path_exists bin/todo
    assert_predicate bin/"todo", :executable?

    output = shell_output("#{bin}/todo -V")
    assert_match "todo 1.2.0", output
  end
end
