alias dcosewget='dcosewget'
function dcosewget ()  { 
	dir=$HOME/repos/installs/ee/$1;
        rm -rf $dir;
        mkdir -p $dir && pushd $dir && wget -c -t 0 -T 120 https://downloads.mesosphere.com/dcos-enterprise/$1/dcos_generate_config.ee.sh && popd
}

alias dcosowget='dcosowget'
function  dcosowget () {
        dir=$HOME/repos/installs/oss/$1;
        rm -rf $dir;
        mkdir -p $dir && pushd $dir && wget -c -t 0 -T 120 https://downloads.dcos.io/dcos/$1/dcos_generate_config.sh
}

alias goinside='goinside'
function goinside () { 
    docker exec -it $1 bash -c "stty cols $COLUMNS rows $LINES && bash"
}

alias dcosowget='dcosowget'
function dcosowget () {
        dir=$HOME/repos/installs/oss/$1;
        rm -rf $dir;
        mkdir -p $dir && pushd $dir && wget -c -t 0 -T 120 https://downloads.dcos.io/dcos/$1/dcos_generate_config.sh
}

# dcosewget testing/master
# minidcos docker  create --license-key=$HOME/go/src/github.com/dcos/licenses-0.txt --docker-version=17.12.1-ce --masters=1 --agents=1 --public-agents=1 --custom-master-volume=/home:/home ~/repos/installs/ee/testing/master/dcos_generate_config.ee.sh   --custom-volume=/home/janisz:/home/janisz --security-mode strict --wait-for-dcos
