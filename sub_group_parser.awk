BEGIN{
    a=0
}
{ 
    groups[a]=$1
    a++
} 
END{ str=""; 
    for(group in groups)
        str=str  groups[group] "|"
    if (str==""){
        str = "_ "
    }
    print user"," substr(str,0,length(str)-1)
}