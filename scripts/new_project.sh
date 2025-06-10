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
                echo "Error: Directory after -d didn' exist"
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

mkdir -p $dir_name/$project_name
cp pdk_setup.sh $dir_name/$project_name
set pdkrootdir=`realpath ../pdk`
sed -i "s#__PDKROOTDIR__#${pdkrootdir}#g" $dir_name/$project_name/pdk_setup.sh


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
