class Machine inherits IO {
  prompt : String;
  stack : Stack <- new Stack;

  init(str : String) : Machine {
    {
      prompt <- str;
      self;
    }
  };

  mainLoop() : Object {
    {
      out_string(prompt);
      stack.push("1");
      stack.layoutStack();
      stack.push("2");
      stack.layoutStack();
    }
  };
};
