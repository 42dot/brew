class Vaulter < Formula
  desc "A CLI tool for 42dot"
  homepage "https://gitlab.42dot.ai/vaulter.git"
  url "https://gitlab.42dot.ai/sysadmin/vaulter.git",
       tag:      "v1.0.0-beta.5",
       revision: "6dcc550ef9f7eaf94df8be3d120afb73f9b6ec9c"

  version "v1.0.0-beta.5"
  license "42dot proprietary"

  bottle do
    root_url "https://binplate.42dot.systems/brew/vaulter/v1.0.0-beta.5"
    sha256 cellar: :any_skip_relocation, big_sur: "88ce4e425bb65eedcb11045065c0460b2435b73eebad91711d65ed936a8bae48"
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
