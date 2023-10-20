class Machine inherits A2I {

  io : IO <- new IO;
  prompt : String;
  stack : Stack <- new Stack;
  exit : Bool <- false;

  init(str : String) : Machine {
    {
      prompt <- str;
      self;
    }
  };

  add() : Object {
    1
  };

  swap() : Object {
    1
  };

  execute() : Object {
    if stack.top() = "+" then
    {
      stack.pop();
      add();
    }
    else
      if stack.top() = "s" then
      {
        stack.pop();
        swap();
      }
      else
        1
      fi
    fi
  };

  parseCmd(str : String) : Object {
    if str = "x" then
      exit <- true
    else
      if str = "d" then
        stack.layoutStack()
      else
        if str = "e" then
          execute()
        else
          stack.push(str)
        fi
      fi
    fi
  };

  mainLoop() : Object {
    while exit = false loop
    {
      io.out_string(prompt);
      parseCmd(io.in_string());
    }
    pool
  };
};
