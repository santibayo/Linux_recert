function extract_groups_from_user(user){
    groups="cat /etc/group|grep -i santi|awk -F: -v user='santi' 'BEGIN{a=0}{ groups[a]=$1;a++;} END{ str=\"\"; for(group in groups){ str=str  groups[group] \",\";} print user\":\" str}'"
    groups|getline(result)
    close(groups)
}
