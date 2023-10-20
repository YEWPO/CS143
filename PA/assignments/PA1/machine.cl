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

  parseCmd(str : String) : Object {
    io.out_string(str.concat("\n"))
  };

  mainLoop() : Object {
    while (exit = false) loop
    {
      io.out_string(prompt);
      parseCmd(io.in_string());
    }
    pool
  };
};
