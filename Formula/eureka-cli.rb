class EurekaCli < Formula
  desc "Standalone CLI for Netflix / Spring Cloud Eureka service registry"
  homepage "https://github.com/loprx/eureka-cli"
  version "0.2.0"
  license all_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loprx/eureka-cli/releases/download/v#{version}/eureka-cli-darwin-arm64"
      sha256 "PLACEHOLDER"
    end
    if Hardware::CPU.intel?
      url "https://github.com/loprx/eureka-cli/releases/download/v#{version}/eureka-cli-darwin-amd64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/loprx/eureka-cli/releases/download/v#{version}/eureka-cli-linux-arm64"
      sha256 "PLACEHOLDER"
    end
    if Hardware::CPU.intel?
      url "https://github.com/loprx/eureka-cli/releases/download/v#{version}/eureka-cli-linux-amd64"
      sha256 "PLACEHOLDER"
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
