#!/bin/sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install node
nvm alias default node

echo Latest version of Node.js has been installed.

