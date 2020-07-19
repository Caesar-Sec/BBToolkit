#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs


echo "installing bash_profile aliases"
git clone https://github.com/Caesar-Sec/recon_profile.git
cd recon_profile
cat .bash_profile >> ~/.bash_profile
source ~/.bash_profile
cd
echo "done"

#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.14.6.linux-amd64.tar.gz
					sudo tar -xvf go1.13.4.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi


#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/


echo "installing JSParser"
git clone https://github.com/SMHTahsin33/JSParser.git
cd JSParser
sudo python setup.py install
cd ~/tools/
echo "done"


echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
echo "done"


echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git
cd ~/tools/
echo "done"

echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo "done"

echo "installing nmap"
sudo apt-get install -y nmap
echo "done"

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "done"

echo "installing Masscan"
git clone https://github.com/robertdavidgraham/masscan
cd masscan
make
cd ~/tools/

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "done"

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

echo "installing LinkFinder"
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
python setup.py install
cd ..
echo "done"

echo "downloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "done"


echo "installing hakrawler"
go get github.com/hakluke/hakrawler
echo "done"

echo "installing XSStrike"
git clone https://github.com/s0md3v/XSStrike.git
echo "done"

echo "installing ffuf"
go get github.com/ffuf/ffuf
echo "done"

echo "installing Chromium"
sudo apt-get install chromium-browser
echo "done"


echo "installing amass"
sudo apt-get install -y amass
echo "done"


echo "installing gau (getallurls)"
GO111MODULE=on go get -u -v github.com/lc/gau
echo "done"

echo "Installing assetfinder" 
go get -u github.com/tomnomnom/assetfinder
echo "done"

echo "Installing unfurl" 
go get -u github.com/tomnomnom/unfurl
echo "done"


echo "Installing GoWitness" 
go get -u github.com/sensepost/gowitness
echo "done"


echo "Installing Subfinder" 
go get -v github.com/projectdiscovery/subfinder/cmd/subfinder
echo "done"



echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
echo -e "Now go forth and break other peoples stuff"

