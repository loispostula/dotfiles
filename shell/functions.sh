function az_login_fsmc {
    export AZURE_CONFIG_DIR=~/.azure/foresight
    az login 
}

function az_login_anglo {
    export AZURE_CONFIG_DIR=~/.azure/anglo
    az login
}

function az_login {
    export AZURE_CONFIG_DIR=~/.azure/perso
    az login
}
