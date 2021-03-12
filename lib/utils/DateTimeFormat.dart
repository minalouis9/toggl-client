String formatDateTime(String dateTimeString){
  List<String> list = dateTimeString.split("T");
  List<String> dateList = list[0].split("-");
  List<String> timeList = list[1].split(":");
  int hours = int.parse(timeList[0]);
  if(hours > 12){
    return "${dateList[2]}-${dateList[1]}-${dateList[0]}\t/\t${hours - 12}:${timeList[1]} PM";
  }
  else{
    if(hours == 0){
      return "${dateList[2]}-${dateList[1]}-\t/\t${dateList[0]}${12}:${timeList[1]} AM";
    }
    else{
      return "${dateList[2]}-${dateList[1]}-\t/\t${dateList[0]}$hours:${timeList[1]} AM";
    }
  }
}