# Installs all my vim plugins
class vim::plugin_repos ( $user = 'michael' ) {
  $bundles = {
    "/home/${user}/.vim/bundle/command-t" => {
      source => 'git@github.com:michaeldfallen/Command-T.git'
    },
    "/home/${user}/.vim/bundle/vim-mustache-handlebars" => {
      source => 'https://github.com/mustache/vim-mustache-handlebars.git'
    },
    "/home/${user}/.vim/bundle/nerdtree" => {
      source => 'https://github.com/scrooloose/nerdtree.git'
    },
    "/home/${user}/.vim/bundle/vim-airline" => {
      source => 'https://github.com/bling/vim-airline.git'
    },
    "/home/${user}/.vim/bundle/vim-gitgutter" => {
      source => 'https://github.com/airblade/vim-gitgutter.git'
    },
    "/home/${user}/.vim/bundle/vim-markdown" => {
      source => 'https://github.com/plasticboy/vim-markdown.git'
    },
    "/home/${user}/.vim/bundle/vim-scala" => {
      source => 'https://github.com/derekwyatt/vim-scala.git'
    },
    "/home/${user}/.vim/bundle/YouCompleteMe" => {
      source => 'https://github.com/Valloric/YouCompleteMe.git'
    },
    "/home/${user}/.vim/bundle/vim-snippets" => {
      source => 'https://github.com/honza/vim-snippets.git'
    },
    "/home/${user}/.vim/bundle/ultisnips" => {
      source => 'https://github.com/SirVer/ultisnips.git'
    },
    "/home/${user}/.vim/bundle/supertab" => {
      source => 'https://github.com/ervandew/supertab'
    },
    "/home/${user}/.vim/bundle/syntastic" => {
      source => 'https://github.com/scrooloose/syntastic.git'
    },
    "/home/${user}/.vim/bundle/ack.vim" => {
      source => 'https://github.com/mileszs/ack.vim.git'
    },
    "/home/${user}/.vim/bundle/indentLine" => {
      source => 'https://github.com/Yggdroot/indentLine.git'
    },
    "/home/${user}/.vim/bundle/gitv" => {
      source => 'https://github.com/gregsexton/gitv.git'
    },
    "/home/${user}/.vim/bundle/vim-fugitive" => {
      source => 'https://github.com/tpope/vim-fugitive.git'
    },
    "/home/${user}/.vim/bundle/nerdtree-git-plugin" => {
      source => 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
    },
    "/home/${user}/.vim/bundle/vim-puppet" => {
      source => 'https://github.com/rodjek/vim-puppet.git'
    },
    "/home/${user}/.vim/bundle/tagbar" => {
      source => 'https://github.com/majutsushi/tagbar.git'
    },
    "/home/${user}/.vim/bundle/python-syntax" => {
      source => 'https://github.com/hdima/python-syntax.git'
    },
    "/home/${user}/.vim/bundle/auto-pairs" => {
      source => 'https://github.com/jiangmiao/auto-pairs.git'
    },
    "/home/${user}/.vim/bundle/vim-librarian" => {
      source => 'https://github.com/hron84/vim-librarian.git'
    },
  }

  $repo_defaults = {
    ensure   => present,
    user     => $user,
    owner    => $user,
    group    => $user,
    provider => git,
  }

  create_resources('vcsrepo', $bundles, $repo_defaults)
}
