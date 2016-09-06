$root = File.dirname(__FILE__)

def bundle(folder_name)
  cd("#{$root}/jbreeden.vim/bundle") do
    unless Dir.exists?(folder_name)
      yield
    end
  end
end

desc "Install my vimrc & plugins"
task :install do
  ln_s "#{$root}/jbreeden.vimrc", File.expand_path("~/.vimrc") rescue nil
  ln_s "#{$root}/jbreeden.vim", File.expand_path("~/.vim") rescue nil

  bundle('vim-fugitive') {
    sh 'git clone https://github.com/tpope/vim-fugitive'
    sh 'vim -u NONE -c "helptags vim-fugitive/doc" -c q'
  }
end
