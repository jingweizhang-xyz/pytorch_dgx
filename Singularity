Bootstrap:docker  
From:skykiny/pytorch_dgx:latest

%labels
MAINTAINER Jingwei

%environment
RAWR_BASE=/code
export RAWR_BASE

%runscript
exec /bin/bash "$@"  

%post  
export PATH="/opt/conda/bin:/usr/local/bin:./":$PATH
