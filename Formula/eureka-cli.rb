class EurekaCli < Formula
  desc "Standalone CLI for Netflix / Spring Cloud Eureka service registry"
  homepage "https://github.com/loprx/eureka-cli"
  version "0.2.0"
  license all_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loprx/eureka-cli/releases/download/v#{version}/eureka-cli-darwin-arm64"
      sha256 "f30809d82c1369437d9657811ae36c55d01a1ca832a832f5830fc4b36b1867a9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/loprx/eureka-cli/releases/download/v#{version}/eureka-cli-darwin-amd64"
      sha256 "5303959d78e765ad03a2727f50d675105f9d6055e50ef0dec226cd1a298be64d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/loprx/eureka-cli/releases/download/v#{version}/eureka-cli-linux-arm64"
      sha256 "3723d0ce36e28a112c871a000a02c9b9f25f81bed2c1518db569c33a14b334b8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/loprx/eureka-cli/releases/download/v#{version}/eureka-cli-linux-amd64"
      sha256 "13ee7b8ee1ee3df6db24e83b731b866ae1bd358a3552ec4236f6840419c0211b"
    end
  end

  def install
    binary = Dir["eureka-cli*"].first
    mv binary, "eureka-cli" if binary != "eureka-cli"
    bin.install "eureka-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eureka-cli --version")
  end
end
