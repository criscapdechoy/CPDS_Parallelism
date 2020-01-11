#! /bin/bash

export TAREADOR_HOME=/home/bsc36/bsc36422/TAREADOR
PATH=$TAREADOR_HOME/install/mcxx/bin:$PATH
PATH=$TAREADOR_HOME/install/valgrind/bin:$PATH
PATH=$TAREADOR_HOME/install/dimemas-4.3.7/bin:$PATH
PATH=$TAREADOR_HOME/install/trf2trf/bin:$PATH

# these two lines are changed with the 4 lines below
#PATH=$TAREADOR_HOME/codes/Dimemas/TOOLS/scripts:$PATH
#PATH=$TAREADOR_HOME/codes/new_scripts:$PATH
PATH=$TAREADOR_HOME/src/scripts/generate_graph:$PATH
PATH=$TAREADOR_HOME/src/scripts/xdot:$PATH
PATH=$TAREADOR_HOME/src/scripts/merge_traces:$PATH
PATH=$TAREADOR_HOME/src/scripts/dimemas_simulations:$PATH


#export TAREADOR_HOME=/home/bsc18/bsc18422/tareador_stable
#PATH=$TAREADOR_HOME/install/mcxx/bin:$PATH
#PATH=$TAREADOR_HOME/install/valgrind/bin:$PATH
#PATH=$TAREADOR_HOME/install/dimemas-4.2.1/bin:$PATH
#PATH=$TAREADOR_HOME/install/trf2trf/bin:$PATH
#PATH=$TAREADOR_HOME/codes/Dimemas/TOOLS/scripts:$PATH
#PATH=$TAREADOR_HOME/codes/new_scripts:$PATH

# Extrae instrumentation and Paraver analysis tool
export EXTRAE_HOME=/apps/CEPBATOOLS/extrae/2.3/bullmpi/64
export EXTRAE_CONFIG_FILE=./extrae.xml
export PARAVER_HOME=/gpfs/apps/NVIDIA/CEPBATOOLS/wxparaver/latest
PATH=$EXTRAE_HOME/bin/:$PARAVER_HOME/bin/:$PATH
export LD_LIBRARY_PATH=${EXTRAE_HOME}/lib:${PARAVER_HOME}/lib:${PARAVER_HOME}/lib/paraver-kernel/:$LD_LIBRARY_PATH

# graphviz -> to plot dependency graphs
PATH=/gpfs/home/bsc18/bsc18422/apps/install/graphviz/bin:$PATH


# fix for Dimemas (making temp Paraver files and sorting them)
export TMPDIR=.
