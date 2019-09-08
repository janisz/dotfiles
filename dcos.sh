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

export DCOS_DNS_ADDRESS=http://master.mesos

export WAIT_FOR_HOSTS=false

export DCOS_PROVIDER=onprem

export DNS_SEARCH=false

export PYTHONUNBUFFERED=true

export DCOS_VARIANT=ee

export DCOS_INTEGRATION_TESTS=true

export PYTHONDONTWRITEBYTECODE=true

export DCOS_LOGIN_UNAME=admin

export DCOS_LOGIN_PW=admin

export TEST_DCOS_RESILIENCY=false

export PYTEST_FREEIPA_KEEP=true

#cp -f /home/gustav/repos/mesosphere/dcos-enterprise/packages/dcos-integration-test/extra/test_clusterstate.py /opt/mesosphere/active/dcos-integration-test/

cp -f /home/gustav/repos/mesosphere/dcos-enterprise/packages/dcos-integration-test/extra/test_bootstrap.py /opt/mesosphere/active/dcos-integration-test/

#cp -f /home/gustav/repos/mesosphere/bouncer/bouncer/app/wsgiapp.py /opt/mesosphere/active/bouncer/bouncer/bouncer/app/

#cp -f /home/gustav/repos/mesosphere/bouncer/bouncer/app/ldap.py /opt/mesosphere/active/bouncer/bouncer/bouncer/app/

#cp -f /home/gustav/repos/mesosphere/bouncer/bouncer/app/models/session.py /opt/mesosphere/active/bouncer/bouncer/bouncer/app/models/

#systemctl restart dcos-bouncer

cd /opt/mesosphere/active/dcos-integration-test

minidcos docker run --test-env pytest -vv -k test_dcos_diagnostics_bundle_create_download_delete
