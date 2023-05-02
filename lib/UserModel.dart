class UserModel{
  List<String>? words;

  UserModel(this.words);
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data= new Map<String,dynamic>();
    data['words']=words;
    return data;
  }
}