//函数      默认值  可选参数
double add(double a, double b, [double c = 0.7, double d = 0.3]) {
  return (a + b) * c;
}

// key  value 形式调用  命名参数{}
double add2(double a, double b,
    {double discount = 1.0, double c = 0, double d = 0}) {
  return (a + b + c + d) * discount;
}

//函数参数
double add3(double a, double b, deal) {
  return deal(a) + deal(b);
}

var fun = (i) => i * i;

//定义变量
String ljn = "ljn";
var i = 10;
//常量
const PI = 3.1415926;
//final可以开始不赋值 只能赋一次  final不仅有const的编译时常量的特性，还是运行时常量  惰性初始化
final dataNow = DateTime.now(); //这种只能用final
final L = 0.123456789;

//数组
var l1 = [1, 2, 3];
/*
* 修改数据
* fillRange(1,2,"aaa")
* 
* 将集合转换成字符串并用字符-连接
* join("-")
* */
var list = new List();
//字典
var map = {"key": "value"}; //map["key"]
/*
* containsValue()
* */
var map2 = new Map();

//赋值运算符
//b??=23   表示如果b为空 23赋值给b

//var b=a ?? 10  a不为空  b=a; a为空  b=10;

//在赋值运算中 如果 ++  --写在前面 先运算在赋值   反之

void test() {
  var list = new List();
  var map = new Map();

  list.forEach((value) {});
  list.map((value) {
    return value * 2;
  });
  //相当于Java kotlin  lambda
  list.map((value) => value * 3);
  list.where((value) {
    return value > 5;
  });
//只要集合中有一个满足条件就返回true
  list.any((value) {
    return value > 5;
  });

  list.every((value) {
    return value > 5;
  });
  map.forEach((key, value) {});
}

/** // ignore: slash_for_doc_comments
 * 闭包
 *
 * 1.全局变量：常驻内存  污染全局
 * 2.局部变量：相反
 *
 * 常驻内存，不污染全局 ---  闭包：函数嵌套函数 并return里面的函数
 */

fn() {
  var a = 123;
  return () {
    a++;
    print(a);
  };
}

//类
class Person {
  //构造函数
  /* Person() {
    print("构造函数");
  }
*/
  //命名构造函数
  Person.now() {
    print("命名构造函数");
  }

  num height;
  num width;

  Person(this.height, this.width);

  /*Person()
      : height = 2,
        width = 2 {
    print("初始化之前赋值")
  }*/

  get area {
    return this.height * this.width;
  }
}

class Web extends Person {
  Web(num height, num width) : super(height, width);
}

void main() {
  //Person person = new Person(10, 4);
  //person.area;

  //时间戳
  var timeStamp = DateTime.now().millisecondsSinceEpoch;
  //时间戳转时间
  var dateTime=DateTime.fromMicrosecondsSinceEpoch(timeStamp);
  //date_format
}
