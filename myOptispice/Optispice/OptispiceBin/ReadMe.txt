# put OptispiceBin in home directory
# 
# put .profile or .bashrc
#
export LD_LIBRARY_PATH=~/OptispiceBin/:$LD_LIBRARY_PATH
export PATH=~/OptispiceBin/:$PATH

Run these once from OptispiceBin

install_name_tool -change /opt/local/lib/libSuiteSparse.4.1.0.dylib ~/OptispiceBin/libSuiteSparse.4.1.0.dylib ospiceResearch 
install_name_tool -change /opt/local/lib/libxml2.2.dylib ~/OptispiceBin/libxml2.dylib ospiceResearch 