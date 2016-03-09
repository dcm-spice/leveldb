Pod::Spec.new do |s|
  s.name         = "leveldb-mirror"
  s.version      = "1.18a"
  s.summary      = "LevelDB : a fast key-value storage library"
  s.description  = "LevelDB is a fast key-value storage library written at Google that provides an ordered mapping from string keys to string values."
  s.homepage     = "https://github.com/google/leveldb"
  s.license      = "New BSD License"
  s.author       = { "Google" => "email@address.com" }
  s.source       = {
    :git => "https://github.com/dcm-spice/leveldb.git",
    :tag => "v#{s.version}",
    :submodules => true
  }
  s.source_files  = "leveldb/db/*.cc",
                    "leveldb/port/*.cc",
                    "leveldb/table/*.cc",
                    "leveldb/util/*.cc",
                    "leveldb/include/leveldb/*.h"
  s.exclude_files = "leveldb/**/*_test.cc",
                    "leveldb/port/win",
                    "leveldb/db/db_bench.cc",
                    "leveldb/db/leveldb_main.cc"
  s.public_header_files = "leveldb/include/leveldb/*.h"
  s.preserve_paths = "leveldb/db",
                     "leveldb/helpers",
                     "leveldb/port",
                     "leveldb/table",
                     "leveldb/util",
                     "Android.mk"
  s.module_name = "leveldb"
  s.header_dir = "leveldb"
  header_path = if ENV["POD_DEVELOPMENT"]
                  File.join(File.dirname(__FILE__), "leveldb")
                else
                  "$(PODS_ROOT)/#{s.name}/leveldb"
                end
  s.pod_target_xcconfig = { "HEADER_SEARCH_PATHS" => header_path }
  s.platforms = { :ios => "6.0", :osx => "10.7" }
  s.compiler_flags = "-DOS_MACOSX", "-DLEVELDB_PLATFORM_POSIX"
end
