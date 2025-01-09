function get_recert_event(){
    command = "date +%Y-%M-%d"
    command | getline result
    close(command)
    recert_step = recertification ? recertification : result
    return recert_step
}

function debugL(message){
    if (debug == "true"){
        print(message)
    }
}

function get_hostname(){
    command = "hostname"
    command | getline result
    close(command)
    return result
}

BEGIN {
    recertification_= get_recert_event()
    hostname = get_hostname()
    print "recert,  hostname , username, groups"
}
{
    username=$1
    groups_file = group ? group : "/etc/group"
    debugL(">> DEBUG: file group = " groups_file)
    command = "cat " groups_file "|grep -E \"\:" username "(,|$)|," username "(,|$)\"|awk -F: -v user=" username " -f sub_group_parser.awk"
    debugL(">> DEBUG: username:'" username "' cmd: " command)
    command | getline result
    close(command)
    print recertification "," hostname "," result
}