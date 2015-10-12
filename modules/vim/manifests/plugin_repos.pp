# Installs all my vim plugins
class vim::plugin_repos ( $user = 'michael' ) {
  $bundles = [
    {
      path => "/home/${user}/.vim/bundle/command-t",
      source => 'git@github.com:michaeldfallen/Command-T.git'
    }, {
      path => "/home/${user}/.vim/bundle/vim-mustache-handlebars",
      source => 'https://github.com/mustache/vim-mustache-handlebars.git'
    }, {
      path => "/home/${user}/.vim/bundle/nerdtree",
      source => 'https://github.com/scrooloose/nerdtree.git'
    }, {
      path => "/home/${user}/.vim/bundle/vim-airline",
      source => 'https://github.com/bling/vim-airline.git'
    }, {
      path => "/home/${user}/.vim/bundle/vim-gitgutter",
      source => 'https://github.com/airblade/vim-gitgutter.git'
    }, {
      path => "/home/${user}/.vim/bundle/vim-markdown",
      source => 'https://github.com/plasticboy/vim-markdown.git'
    }, {
      path => "/home/${user}/.vim/bundle/vim-scala",
      source => 'https://github.com/derekwyatt/vim-scala.git'
    }, {
      path => "/home/${user}/.vim/bundle/YouCompleteMe",
      source => 'https://github.com/Valloric/YouCompleteMe.git'
    }, {
      path => "/home/${user}/.vim/bundle/vim-snippets",
      source => 'https://github.com/honza/vim-snippets.git'
    }, {
      path => "/home/${user}/.vim/bundle/ultisnips",
      source => 'https://github.com/SirVer/ultisnips.git'
    }, {
      path => "/home/${user}/.vim/bundle/supertab",
      source => 'https://github.com/ervandew/supertab'
    }, {
      path => "/home/${user}/.vim/bundle/syntastic",
      source => 'https://github.com/scrooloose/syntastic.git'
    }, {
      path => "/home/${user}/.vim/bundle/ack.vim",
      source => 'https://github.com/mileszs/ack.vim.git'
    }, {
      path => "/home/${user}/.vim/bundle/indentLine",
      source => 'https://github.com/Yggdroot/indentLine.git'
    }, {
      path => "/home/${user}/.vim/bundle/gitv",
      source => 'https://github.com/gregsexton/gitv.git'
    }, {
      path => "/home/${user}/.vim/bundle/vim-fugitive",
      source => 'https://github.com/tpope/vim-fugitive.git'
    }, {
      path => "/home/${user}/.vim/bundle/nerdtree-git-plugin",
      source => 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
    }, {
      path => "/home/${user}/.vim/bundle/vim-puppet",
      source => 'https://github.com/rodjek/vim-puppet.git'
    }, {
      path => "/home/${user}/.vim/bundle/tagbar",
      source => 'https://github.com/majutsushi/tagbar.git'
    }, {
      path => "/home/${user}/.vim/bundle/python-syntax",
      source => 'https://github.com/hdima/python-syntax.git'
    }, {
      path => "/home/${user}/.vim/bundle/auto-pairs",
      source => 'https://github.com/jiangmiao/auto-pairs.git'
    }, {
      path => "/home/${user}/.vim/bundle/vim-librarian",
      source => 'https://github.com/hron84/vim-librarian.git'
    },
  ]

  $repo_defaults = {
    ensure   => latest,
    user     => $user,
    owner    => $user,
    group    => $user,
    provider => git,
  }

  create_resources('vcsrepo', $bundles, $repo_defaults)
}
