# VHS tape for gh-orgsync's README demo.
# Install VHS: brew install vhs
# Re-record:   vhs demo/gh-orgsync.tape   (run from the repo root)

Output demo/gh-orgsync.gif

Set Shell "bash"
Set FontSize 18
Set Width 1000
Set Height 560
Set Padding 20
Set Theme "Dracula"
Set TypingSpeed 60ms

Hide
Type "mkdir -p /tmp/gh-orgsync-demo && cd /tmp/gh-orgsync-demo && rm -rf octocat && clear"
Enter
Show

Type "gh orgsync -s octocat"
Enter
Sleep 3s

Sleep 1s
Type "gh orgsync -s octocat"
Enter
Sleep 3s

Sleep 2s
