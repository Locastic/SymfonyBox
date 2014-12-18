#!/bin/bash

function usage {
    echo 'usage: ./vagrantee.sh [ -a repository ] [ -r application ]
          -a, --add  <repository-url>    Adds an application by cloning the given repository url into the "application" folder
          -r, --run  <application-name>  Changes the current synced folder to the specified application and runs vagrant reload'

}

###### Main

clone_url=0
run_app=0

while [ "$1" != "" ]; do
    case $1 in
        -a | --add )            shift
                                clone_url=$1
                                ;;
        -r | --run )            shift
                                run_app=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

if [ "$run_app" != "0" ]; then
    if [ "$run_app" == "" ]; then
        echo "Error: you must specify the application to run."
        exit 0
    else
        if [ -d "./application/$run_app" ]; then
            echo "Setting up Vagrantfile for $run_app application..."
            sed -i.bak 's/application\/[a-zA-Z0-9\.\-]*/application\/'"$run_app"'/' ./Vagrantfile
            echo "Vagrantfile is ready. Running Vagrant..."
            command="up"
            vagrant_status=`/usr/bin/vagrant status | grep -c "not created"`
            if [ "$vagrant_status" = "0" ]; then
                command="reload"
            fi

            /usr/bin/vagrant "$command"

            exit 1
        else
            echo "The application $run_app was not found in the application dir. Did you forget to add it with -a?"
            exit 0
        fi
    fi
fi

if [ "$clone_url" != "0" ]; then
    if [ "$clone_url" == "" ]; then
        echo "Error: you must provide the application git url."
        exit 0
    else
        echo "Cloning application repository into the application folder..."
        /usr/bin/git clone $clone_url ./application/
        echo "Application successfully added."
        exit 1
    fi
fi
