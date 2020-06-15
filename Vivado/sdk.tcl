if { ![info exists env(VIVADO_DESIGN_NAME)] } {
    puts "Please set the environment variable VIVADO_DESIGN_NAME before running the script"
    return
}
set design_name $::env(VIVADO_DESIGN_NAME)
puts "Using design name: ${design_name}"

# Set SDK workspace
setws ./${design_name}/${design_name}.sdk
# Create a HW project
createhw -name hw1 -hwspec ./${design_name}/${design_name}.sdk/${design_name}_wrapper.hdf
# Create a BSP project
createbsp -name bsp1 -hwproject hw1 -proc ps7_cortexa9_0 -os standalone
# Create application project
createapp -name test -hwproject hw1 -bsp bsp1 -proc ps7_cortexa9_0 -os standalone \
-lang C -app {Hello World}
# Build all projects
projects -build

