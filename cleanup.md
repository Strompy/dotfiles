### Homebrew:
Cleanup unused stuff:
`$brew cleanup -s`

Cleanup cached versions of installed packages:
`$ rm -rf "$(brew --cache)"`

### Ruby Gems:
Remove old versions:
`$ gem cleanup`

### NPM:
Clear npm cache:
`$ npm cache clean --force`

### Clear out all docker images:
`$ docker system prune --all`
