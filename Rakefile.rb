desc "Install my vimrc & plugins"
task :install do
  ln_s "#{File.dirname(__FILE__)}/jbreeden.vimrc", File.expand_path("~/.vimrc")
  ln_s "#{File.dirname(__FILE__)}/jbreeden.vim", File.expand_path("~/.vim")
end
