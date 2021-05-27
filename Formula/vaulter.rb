class Vaulter < Formula
  desc "A CLI tool for 42dot"
  homepage "https://gitlab.42dot.ai/vaulter.git"
  url "https://gitlab.42dot.ai/sysadmin/vaulter.git",
       tag:      "v1.0.0-beta.4",
       revision: "06baa984967b565dbc910429ddc1ad9453d9a8ad"

  version "v1.0.0-beta.4"
  license "42dot proprietary"

  bottle do
    root_url "https://binplate.42dot.systems/brew/vaulter/v1.0.0-beta.4"
    sha256 cellar: :any_skip_relocation, big_sur: "49de7d31a973a87055c0c9ba719a4f9069e56005e2a095fff5238e41a9cfe901"
  end

  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "go", "build", "-ldflags",
             "-s -w -X gitlab.42dot.ai/sysadmin/vaulter/cmd.version=#{version}",
             *std_go_args
  end

  test do
    assert_match "Vaulter: #{version}",
                 shell_output("#{bin}/vaulter version")
  end
end
