function dotfiles --wraps='git --git-dir=/home/nico/.dotfiles/ --work-tree=/home/nico' --description 'alias dotfiles=git --git-dir=/home/nico/.dotfiles/ --work-tree=/home/nico'
    git --git-dir=/home/nico/.dotfiles/ --work-tree=/home/nico $argv
end
