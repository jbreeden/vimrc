$root = File.dirname(__FILE__)

def bundle(folder_name)
  bundle_dir = "#{$root}/jbreeden.vim/bundle"
  target = "#{bundle_dir}/#{folder_name}"
  unless Dir.exists?(target)
    cd(bundle_dir) do
      yield # Provided block should create the target dir
    end
  end
end

def github_bundle(folder_name, repo_name) 
  bundle(folder_name) {
    sh "git clone --depth=1 https://github.com/#{repo_name}"
    yield if block_given?
  }
end

desc 'Install my vimrc & plugins'
task :install do
  vimrc_path = "#{$root}/jbreeden.vimrc"
  vimdir_path = "#{$root}/jbreeden.vim"
  vimrc_target = File.expand_path('~/.vimrc')
  vimdir_target = File.expand_path('~/.vim')
  
  if File.exists?(vimrc_target)
    if !File.readlink(vimrc_target) == vimrc_path
      $stderr.puts "ERROR ~/.vimrc already exists."
      exit 1
    end
  else
    ln_s vimrc_path, File.expand_path("~/.vimrc")
  end

  if File.exists?(vimdir_target) 
    if !File.readlink(vimdir_target) == vimdir_path
      $stderr.puts "ERROR ~/.vim already exists."
      exit 1
    end
  else
    ln_s vimdir_path, File.expand_path("~/.vim")
  end

  github_bundle('vim-fugitive', 'tpope/vim-fugitive') {
    sh 'vim -u NONE -c "helptags vim-fugitive/doc" -c q'
  }
  github_bundle("syntastic", "scrooloose/syntastic")
  github_bundle("vim-surround", "tpope/vim-surround")
  github_bundle("vim-indent-object", "michaeljsmith/vim-indent-object")
  github_bundle("vim-indent-object", "michaeljsmith/vim-indent-object")
  github_bundle("vim-monokai", "sickill/vim-monokai")
  github_bundle("vim-colors-solarized", "altercation/vim-colors-solarized")
end

