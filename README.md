# Quick installation
This assumes that nvim is already installed

First check out [Setting up git HTTPS](https://docs.github.com/en/get-started/git-basics/caching-your-github-credentials-in-git) in order to set up git push / pull etc

Then clone the repository for neovim into the .configs folder using the following piece of code:
```
git clone https://github.com/BossThePro/nvim-linux ~/.config/nvim
```

Open nvim and you might see some errors due to missing packages (treesitter-cli) as an example

To install it run the following command:

```
yay -S tree-sitter-cli
```

This assumes that yay is installed, if it isn't installed go [here](https://github.com/Jguer/yay) and follow the installation instructions found by scrolling a bit down

Afterwards, we need to make sure that all of the packages for our language server protocol are installed (in this case pyright, clangd and typescript/typescript language server), we can install them using the following piece of code:

For this we need to use npm, which we can install with the following command:

```
sudo pacman -S npm
```

Afterwards we can run npm to install the language servers
```
npm install pyright clang ts ts-language-server
```

Now we it should be ready to go. Happy coding!
