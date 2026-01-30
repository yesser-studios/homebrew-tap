# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "pong-by-yesser-studios" do
  version "1.2.4"
  sha256 "689286647b33763fb63bb14efc26ef30b4d28bac56ddda3c2a39f193c9d984d5"

  url "https://github.com/yesser-studios/Pong/releases/download/v#{version}/mac-arm64.app.tar.gz"
  name "pong-by-yesser-studios"
  desc "Pong clone made in C#"
  homepage "https://github.com/yesser-studios/Pong"

  app "Pong.app"
end
