::RandomAdjs = File.open(Pathname(File.dirname(__FILE__)) + "./data/adjs.dat"){|f| Marshal.load(f)}
::RandomNouns = File.open(Pathname(File.dirname(__FILE__)) + "./data/nouns.dat"){|f| Marshal.load(f)}
