#export VIVADO=/opt/Xilinx/Vivado/2018.2/bin/vivado
export VIVADO=/home/lsa/xilinx/2018.2/Vivado/2018.2/bin/vivado

if [ -f $VIVADO ]; then
    $VIVADO -mode batch -source build.tcl
elif [ -f ~/.bash_aliases ]; then
  echo ""
  echo "###############################"
  echo "### Failed to locate Vivado ###"
  echo "###############################"
  echo ""
  echo "This script file 'build.sh' did not find Vivado installed in:"
  echo ""
  echo "    $VIVADO"
  echo ""
  echo "Fix the problem by doing one of the following:"
  echo ""
  echo " 1. If you do not have this version of Vivado installed,"
  echo "    please install it or download the project sources from"
  echo "    a commit of the Git repository that was intended for"
  echo "    your version of Vivado."
  echo ""
  echo " 2. If Vivado is installed in a different location on your"
  echo "    PC, please modify the first line of this batch file "
  echo "    to specify the correct location."
  echo ""
fi
