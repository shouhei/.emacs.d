# .emacs.d

##require

* cask
* .zshrc

### cask
```
curl -fsSkL https://raw.github.com/cask/cask/master/go | python
```

### .zshrc

```
export PATH="/home/yamaguchi/.cask/bin:$PATH"
export TERM=xterm-256color
```

### js2-mode

```
npm install eslint-config-airbnb eslint-plugin-import eslint-plugin-react eslint-plugin-jsx-a11y eslint -g
npm install -g jscs
```

defaultrc.dの中から、.eslintrcと.jscsrcをコピーして利用する
