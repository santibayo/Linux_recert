{
    username=$1
    #print username
    command = "cat group|grep -i " username "|awk -F: -v user=" username " -f sub_group_parser.awk"
    command | getline result
    close(command)
    print result
}



