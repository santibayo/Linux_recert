function get_recert_event(){
    command = "date +%Y-%M-%d"
    command | getline result
    close(command)
    recert_step = recertification ? recertification : result
    return recert_step
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
}
{
    username=$1
    #print username
    command = "cat /etc/group|grep -i " username "|awk -F: -v user=" username " -f sub_group_parser.awk"
    command | getline result
    close(command)
    print recertification "," hostname "," result
}



