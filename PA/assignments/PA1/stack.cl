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

  empty() : Bool {
    isvoid top
  };

  push(item : String) : List {
    let list : List <- (new List).init(item, top) in {
      top <- list;
    }
  };

  pop() : Object {
    top <- top.getPrev()
  };

  top() : String {
    top.getStr()
  };

  layoutStack() : Object {
    top.layoutList(top)
  };

};
