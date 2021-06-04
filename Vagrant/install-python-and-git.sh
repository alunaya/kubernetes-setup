yum groupinstall "Development Tools" -y
yum install openssl-devel libffi-devel bzip2-devel -y

yum install wget -y

#install python
mkdir /tmp/python-install
cd /tmp/python-install
export VER=3.9.5
wget https://www.python.org/ftp/python/3.9.5/Python-${VER}.tgz
tar xvf Python-${VER}.tgz
cd Python-${VER}
./configure --enable-optimizations
make altinstall
update-alternatives --install /usr/local/bin/python3 python3 /usr/local/bin/python3.9 1
update-alternatives --install /usr/local/bin/pip3 pip3 /usr/local/bin/pip3.9 1


#install git
mkdir /tmp/git-install
cd /tmp/git-install
yum -y install wget perl-CPAN gettext-devel perl-devel  openssl-devel zlib-devel curl-devel expat-devel  getopt asciidoc xmlto docbook2X
ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi
export GIT_VER=2.31.1
wget https://github.com/git/git/archive/v${GIT_VER}.tar.gz
tar -xvf v${GIT_VER}.tar.gz
cd git-*
make configure
./configure --prefix=/usr
make
make install


#cleanup
rm -rf /tmp/python-install
rm -rf /tmp/git-install