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

  execute() : Object {
    {
      1;
    }
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
