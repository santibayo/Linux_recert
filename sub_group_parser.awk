BEGIN{
    a=0
}
{ 
    groups[a]=$1
    a++
} 
END{ str=""; 
    for(group in groups)
        str=str  groups[group] ","
    print user":" str
}