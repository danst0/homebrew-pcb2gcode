# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Pcb2gcode < Formula
  desc "Command-line tool for isolation routing and drilling of PCBs"
  homepage "https://github.com/pcb2gcode/pcb2gcode#commonbuild"
  url "https://github.com/pcb2gcode/pcb2gcode.git"
  #url "https://github.com/pcb2gcode/pcb2gcode/releases/download/v1.2.2/pcb2gcode-1.2.2.tar.gz"
  version "1.2.2"
  sha256 "8886a068a1726b5d1787e3fd5891f76a37415429081441bd82cca2a256082924"

  # depends_on "cmake" => :build
  #depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on "boost"
  depends_on "pkg-config"
  #depends_on "glibmm"
  depends_on "gtkmm"
  depends_on "gerbv"
  depends_on "autoconf"
  depends_on "automake"
  depends_on "libtool"
  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    #system "/usr/local/bin/glibtoolize"
    #system "/usr/local/bin/aclocal"
    #system "/usr/local/bin/automake", "--add-missing"


    system "/usr/local/bin/autoreconf -i"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    #ENV['CFLAGS']="-std=c++11"
    
    system "make", "-j"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "pcb2gcode --version"
  end
end
