function ssh_login(directory) {
    filename = directory".ssh/id_rsa.pub"
    command = "test -e " filename " && echo exists || echo not_exists"
    command | getline result
    close(command)
    return (result == "exists")
}

function get_recert_event(){
    command = "date +%Y-%M-%d"
    command | getline result
    close(command)
    recert_step = recertification ? recertification : result
    return recert_step
}

BEGIN {
    recertification_= get_recert_event()
}
## esto es para el archivo /etc/shadow
## almacenamos en un array asociativo tanto la fecha del ultimo cambio como el esquema de password
NR==FNR {
    shadow_lastchanged[$1] = $3
    shadow_pass_scheme[$1] = $2
    next
}
## esto es para el archivo /etc/passwd
{
    username = $1
    uid = $3
    gid = $4
    shell = $7
    home = $6
    ssh_login_key = ssh_login(home)
    shadow = shadow_pass_scheme[username] ? substr(shadow_pass_scheme[username],0,4): "N/A"
    last_changed = shadow_lastchanged[username] ? shadow_lastchanged[username]*24*60*60*1000: "N/A"
    print recertification_ "," username "," uid "," gid "," shell "," last_changed"," home "," shadow "," ssh_login_key
}