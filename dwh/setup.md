Installing Jupyter, Pandas & Co.
================================

First: Pandas officially recommends Anaconda, so use this unless you have reasons!
I once had trouble with Anaconda when using modules that are not available via conda package manager (for example, at the company, all packages are only built with pip
Assuming we want to do everything with Python 3, since it is more modern and well-supported and whatnot!!

So we always use 'pip3', since 'pip' installs in 2.x directories, invisible to Python 3. 

History (and what not to do)
----------------------------

# for using Pandas in Python3 in Ubuntu 
# --> as of 2016-Feb on Vivid only gives v0.15, although 0.17 is current!!
# BAAAAD: sudo apt-get install python3-pandas python3-pip

# BAAAAD: pip3 install anything  # installs to ~/.local site-packages, since I forgot sudo :((

What to do
----------

# Correct way:
sudo mkdir ~/.local/lib/python3.4   # make sure pip3 without sudo fails with error!!
# I want to install everythin globally, since jupyter doesn't include local site-pkgs path
# and it's a bother to add it manually each time.

# but first: to compile Python packages (when getting them with pip):
sudo apt-get install build-essential python3-dev

# just for building matplotlib with pip (also brings in libpng): 
sudo apt-get install libfreetype6-dev

# finally:
sudo pip3 install pandas matplotlib jupyter


