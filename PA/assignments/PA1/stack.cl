class List inherits IO {

  str : String;
  prev : List;

  getStr() : String {
    str
  };

  getPrev() : List {
    prev
  };

  init(item : String, pb: List) : List {
    {
      str <- item;
      prev <- pb;
      self;
    }
  };

  layoutList(ptr : List) : Object {
    if (isvoid ptr) then
      1
    else {
      out_string(ptr.getStr().concat("\n"));
      layoutList(ptr.getPrev());
    }
    fi
  };

};

class Stack {

  top : List;
  num : Int <- 0;

  empty() : Bool {
    num = 0
  };

  size() : Int {
    num
  };

  push(item : String) : List {
    let list : List <- (new List).init(item, top) in {
      num <- num + 1;
      top <- list;
    }
  };

  pop() : Object {
    {
      top <- top.getPrev();
      num < num - 1;
    }
  };

  top() : String {
    top.getStr()
  };

  layoutStack() : Object {
    top.layoutList(top)
  };

};
