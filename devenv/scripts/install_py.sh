sudo apt-get install -y build-essential python-dev python-setuptools python-pip python-smbus libncursesw5-dev libgdbm-dev libc6-dev \
zlib1g-dev libsqlite3-dev tk-dev libssl-dev openssl libffi-dev

git clone git://github.com/yyuu/pyenv.git ~/.pyenv
 echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
 echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
 echo 'eval "$(pyenv init -)"' >> ~/.bashrc
 exec $SHELL -l
