import 'dart:io';
import 'dart:math';

void main() {
  PointsManage p1 = PointsManage();
  print(
      'which shape do you want to add, press (t) for triangle OR (r) for rectangle');
  String c = stdin.readLineSync()!;
  switch (c) {
    case 't':
      p1.addTrian();
      p1.printShape();
      break;
    case 'r':
      p1.addRect();
      p1.printShape();
      break;
    default:
      print('invaild option');
  }
  print('do you want the perimeter ? (y/n)');
  String s = stdin.readLineSync()!;

  if (s == 'n') {
    print('good bye!');
  } else if (s == 'y') {
    if (c == 't') {
      print(p1.trianPerimeter(p1._shapes['Triangle']!));
    } else if (c == 'r') {
      print(p1.rectPerimeter(p1._shapes['Rectangle']!));
    } else {
      print('invaild option');
    }
  }
}

class Point {
  int x, y;
  Point(this.x, this.y);
  Point.origin()
      : x = 0,
        y = 0;
}

class PointsManage {
  List<Point> _points = [];
  Map<String, List<Point>> _shapes = {};
  //double sum = 0;

  void addPoints(int x, int y) {
    _points.add(Point(x, y));
  }

  void addOrigin() {
    _points.add(Point.origin());
  }

  void addRect() {
    List<Point> rectPoints = [];
    print('enter points, Separate them with just a comma "x,y"');
    for (int i = 1; i <= 4; i++) {
      print('enter point x$i, y$i');
      String input = stdin.readLineSync()!;
      List<String> xy = input.split(',');
      rectPoints.add(Point(
        int.parse(xy[0]),
        int.parse(xy[1]),
      ));
    }
    _shapes.addAll({'Rectangle': rectPoints});
  }

  void addTrian() {
    List<Point> trianPoints = [];
    print('enter points, Separate them with just a comma "x,y"');
    for (int i = 1; i <= 3; i++) {
      print('enter point x$i, y$i');
      String input = stdin.readLineSync()!;
      List<String> xy = input.split(',');
      trianPoints.add(Point(
        int.parse(xy[0]),
        int.parse(xy[1]),
      ));
    }
    _shapes.addAll({'Triangle': trianPoints});
  }

  void printPoints() {
    for (var item in _points) {
      print('(${item.x}, ${item.y})');
    }
  }

  void printShape() {
    _shapes.forEach((key, value) {
      print('shape is $key');
      for (var item in value) {
        print('(${item.x}, ${item.y})');
      }
    });
  }

  double trianPerimeter(List<Point> points) {
    double sum = 0;
    for (int i = 0; i <= 1; i++) {
      for (int j = i + 1; j <= 2; j++) {
        var x = pow(points[i].x - points[j].x, 2);
        var y = pow(points[i].y - points[j].y, 2);
        //sum = 0;
        sum += sqrt(x + y);
      }
    }
    return sum;
  }

  double rectPerimeter(List<Point> points) {
    double sum = 0;
    var x = pow(points[0].x - points[1].x, 2);
    var y = pow(points[1].y - points[2].y, 2);
    //sum = 0;
    sum += (sqrt(x + y) * 2);
    return sum;
  }
}
