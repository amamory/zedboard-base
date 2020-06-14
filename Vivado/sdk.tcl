# update the design name 
set design_name zedboard_base

#file mkdir ./$design_name/$design_name.sdk
#file copy -force ./$design_name/zedboard_base.runs/impl_1/zedboard_base_wrapper.sysdef ./$design_name/zedboard_base.sdk/zedboard_base_wrapper.hdf

#launch_sdk -workspace ./$design_name/zedboard_base.sdk -hwspec ./$design_name/zedboard_base.sdk/zedboard_base_wrapper.hdf

# Set SDK workspace
#setws /tmp/workspace
# Create a HW project
createhw -name hw1 -hwspec ./$design_name/$design_name.sdk/${design_name}_wrapper.hdf
# Create a BSP project
createbsp -name bsp1 -hwproject hw1 -proc ps7_cortexa9_0 -os standalone
# Create application project
createapp -name test -hwproject hw1 -bsp bsp1 -proc ps7_cortexa9_0 -os standalone \
-lang C -app {Hello World}
# Build all projects
projects -build

