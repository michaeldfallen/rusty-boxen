commandT="/opt/rusty-boxen/modules/vim/files/vim/bundle/Command-T"

cd "$commandT/ruby/command-t"

ruby extconf.rb
make

cd "$commandT"

make
