function toDate(obj){
    var  time = new Date(obj);
    var  ntime=time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate();
    return ntime;
}