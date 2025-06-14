#!/usr/bin/env tcsh

################################################
#        Create project with scripts           #
################################################

umask 077

# Default values
set project_name = ""
set dir_name = "./"

# Show help function using goto
if ($#argv == 0) then
    goto show_help
endif

# Argument parsing loop
while ($#argv > 0)
    switch ("$1")
        case -h:
        case --help:
            goto show_help
            breaksw

        case -n:
            shift
            if ($#argv == 0) then
                echo "Error: Missing project name after -n"
                exit 1
            endif
            set project_name = "$1"
            shift
            breaksw

        case -d:
            shift
            if ($#argv == 0) then
                echo "Error: Missing directory after -d"
                exit 1
            endif
            set dir_name = "$1"
            if (! -e $dir_name) then
                echo "Error: Directory after -d didn't exist"
                exit 1
            endif
            shift
            breaksw

        default:
            echo "Unknown option: $1"
            goto show_help
            breaksw
    endsw
end

# Mandatory check
if ("$project_name" == "") then
    echo "Error: -n is required"
    goto show_help
    exit 1
endif

# Create project directory
if (! -e $dir_name) then
    echo "Error: Directory '$dir_name' does not exist!"
    exit 1
endif
if (! -d $dir_name) then
    echo "Error: '$dir_name' is not a directory!"
    exit 1
endif
if (-e $dir_name/$project_name) then
    echo "Error: Project '$project_name' already exists in '$dir_name'!"
    exit 1
endif
echo "[info] Creating project '$project_name' in directory '$dir_name'"
if (! -d $dir_name) then
    echo "Error: Directory '$dir_name' does not exist!"
    exit 1
endif
if (! -d $dir_name/$project_name) then
    mkdir -p $dir_name/$project_name
else
    echo "Error: Project directory '$dir_name/$project_name' already exists!"
    exit 1
endif
# Copy pdk_setup.sh to the project directory
echo "[info] Copying pdk_setup.sh to '$dir_name/$project_name'"
if (! -e pdk_setup.sh) then
    echo "Error: pdk_setup.sh does not exist in the current directory!"
    exit 1
endif
if (! -f pdk_setup.sh) then
    echo "Error: pdk_setup.sh is not a file!"
    exit 1
endif
if (! -w $dir_name) then
    echo "Error: No write permission for directory '$dir_name'!"
    exit 1
endif
if (! -w $dir_name/$project_name) then
    echo "Error: No write permission for project directory '$dir_name/$project_name'!"
    exit 1
endif
if (! -r pdk_setup.sh) then
    echo "Error: No read permission for pdk_setup.sh!"
    exit 1
endif
if (! -x pdk_setup.sh) then
    echo "Warning: pdk_setup.sh is not executable, setting it to executable"
    chmod +x pdk_setup.sh
endif
if (! -e ../pdk) then
    echo "Error: PDK directory '../pdk' does not exist!"
    exit 1
endif
if (! -d ../pdk) then
    echo "Error: '../pdk' is not a directory!"
    exit 1
endif
if (! -r ../pdk) then
    echo "Error: No read permission for PDK directory '../pdk'!"
    exit 1
endif

cp pdk_setup.sh $dir_name/$project_name
set pdkrootdir=`realpath ../pdk`
sed -i "s#__PDKROOTDIR__#${pdkrootdir}#g" $dir_name/$project_name/pdk_setup.sh

cp ../pvs_files/pvtech.lib $dir_name/$project_name

exit 0

# Help section
show_help:
cat << EOF

Usage: $0 [options]

Available options:
  -h, --help        Display this help message
  -n                Project name
  -d                Directory to create the project

Example:
  $0 -n project_name -d dir

EOF
exit 0
