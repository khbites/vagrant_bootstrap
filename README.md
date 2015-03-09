# Vagrant Development Basebox

This is my vagrant basebox

## Prerequisites

### Vagrant (Doh!)

I use [Chocolatey](https://chocolatey.org/packages) to install packages so I do `choco install vagrant` in an **Administrator** console

#### Install vagrant plugins

```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-cachier

```
 
### Ruby

Ruby and rubygems must be installed. 

http://rubyinstaller.org/downloads/
http://railsinstaller.org/en (2.1.5)
https://github.com/oneclick/rubyinstaller

current Versions. Install as Administrator (right click executable - run as admin)

	Ruby 2.2.1 (x64)
		Installed to C:\Ruby
	DevKit
		For use with Ruby 2.0 and 2.1 (x64 - 64bits only)
		Extract to C:\Ruby\DevKit\

		
Don't use a directory with **spaces** e.g. Program Files, as this will bring [problems with installing gems](https://stackoverflow.com/questions/5999507/mingw-make-cant-handle-spaces-in-path) later on...

```
> ruby --version
ruby 2.2.1p85 (2015-02-26 revision 49769) [x64-mingw32]
> cd C:\Ruby
> cd .\DevKit
> ruby dk.rb init
> ruby dk.rb review
> ruby dk.rb install
# Test gem by installing
> gem install rdoc
```

### SSL Errors

Vagrant + Librarian + Chef on Windows
https://gist.github.com/geedelur/84dc954f181c77678717

* Railsinstaller
* gem install certified 
* require in cheffile
* Invoke-WebRequest http://curl.haxx.se/ca/cacert.pem -OutFile c:\Ruby\cacert.pem
* SSL Cert file + path in Env
* gem update + gem update --system (<- as admin)
	
			
		#### Other/older notes that didn't work
		rubygems 2.4 is broken
		Luis comment on this 
			https://groups.google.com/forum/#!topic/rubyinstaller/McLTqcU35FY
			https://github.com/rubygems/rubygems/issues/1087
			https://gist.github.com/luislavena/f064211759ee0f806c88
			
			
		choco install mingw
		git clone rubyinstaller
		rake ruby21

		If you get an ssl error from `gem install` check out [this gist](https://gist.github.com/luislavena/f064211759ee0f806c88#installing-using-update-packages-new)
		> ERROR:  Could not find a valid gem 'chef' (= 12.1.0), here is why:
		>          Unable to download data from https://rubygems.org/ - SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed (https://api.rubygems.org/specs.4.8.gz)
		> gem update --system
		https://stackoverflow.com/questions/9199660/why-is-ruby-unable-to-verify-an-ssl-certificate
			
		https://stackoverflow.com/questions/5720484/how-to-solve-certificate-verify-failed-on-windows
		curl -o c:\cacert.pem http://curl.haxx.se/ca/cacert.pem
		$env:SSL_CERT_FILE = 'C:\Ruby\cacert.pem'
		$env:SSL_CERT_DIR = 'C:\Ruby\Ruby2.1.0\lib\ruby\2.1.0\rubygems\ssl_certs'

		; set SSL_CERT_FILE=c:\Ruby\cacert.pem

		Invoke-WebRequest http://curl.haxx.se/ca/cacert.pem -OutFile c:\Ruby\cacert.pem
		Set-Item -Path env:SSL_CERT_FILE -Value C:\Ruby\cacert.pem

		Ruby Doctor
		https://gist.github.com/iongion/b8e2eec084ab25fa8980
		curl -OutFile doctor.rb RAWFILEURL


### Gems

``` 
gem install chef 
gem install librarian-chef 
```
http://gnuwin32.sourceforge.net/packages/gtar.htm
Download and install http://gnuwin32.sourceforge.net/downlinks/tar-bin.php


## Base Box

I started with [Rove.io](http://rove.io/?pattern=rails) with Shared ID *e9ed39d96a4069801aab4bbee1883eab*

https://github.com/chef/bento

> gem install chef
> gem install librarian-chef
> librarian-chef install 

## Configure

```
cp settings-sample.sh settings.sh
```

edit your settings