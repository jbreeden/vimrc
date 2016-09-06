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
  vimrc_path = "#{$root}/jbreeden.vimrc"
  vimdir_path = "#{$root}/jbreeden.vim"
  ln_s vimrc_path, File.expand_path("~/.vimrc") rescue nil
  ln_s vimdir_path, File.expand_path("~/.vim") rescue nil

  bundle('vim-fugitive') {
    sh 'git clone https://github.com/tpope/vim-fugitive'
    sh 'vim -u NONE -c "helptags vim-fugitive/doc" -c q'
  }

  bundle("syntastic") {
    sh "git clone --depth=1 https://github.com/scrooloose/syntastic"
  }

  bundle("vim-surround") {
    sh "git clone --depth=1 https://github.com/tpope/vim-surround"
  }
end
