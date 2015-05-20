Pod::Spec.new do |s|
  s.name         = "leveldb"
  s.version      = "1.18"
  s.summary      = "LevelDB is a fast key-value storage library written at Google that provides an ordered mapping from string keys to string values."
  s.description  = <<-DESC
                   A longer description of leveldb in Markdown format.
                   DESC
  s.homepage     = "https://github.com/google/leveldb"
  s.license      = "MIT (example)"
  s.author       = { "Google" => "email@address.com" }

  s.source       = { :git => "http://git.drecom.jp/askeloef_peter/drecom-leveldb", :tag => "v#{s.version}", :submodules => true }
  s.source_files  = ["leveldb/db/*.cc", "leveldb/port/*.cc", "leveldb/table/*.cc", "leveldb/util/*.cc", "leveldb/include/leveldb/*.h"]
  s.exclude_files = ["leveldb/**/*_text.cc", "leveldb/port/win"]
  s.public_header_files = "leveldb/include/leveldb/*.h"
  s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(PODS_ROOT)/leveldb/leveldb" }
  s.compiler_flags = ["-DOS_MACOSX", "-DLEVELDB_PLATFORM_POSIX"]
end