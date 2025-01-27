# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class SvtAv1 < Formula
  desc "SVT-AV1 video codec"
  homepage "https://gitlab.com/AOMediaCodec/SVT-AV1"
  url "https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.4.1/SVT-AV1-v1.4.1.tar.gz"
  head "https://gitlab.com/AOMediaCodec/SVT-AV1"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "make" => :build
  depends_on "yasm" => :build
  
  def install
    Dir.chdir("Build")
    system "cmake", "..", "-G", "Unix Makefiles", "-DCMAKE_BUILD_TYPE=Release", "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/SvtAv1EncApp", "--help"
  end
end
