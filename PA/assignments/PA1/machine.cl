class Machine inherits IO {
  prompt : String;

  init(str : String) : Machine {
    {
      prompt <- str;
      self;
    }
  };

  mainLoop() : Object {
    out_string(prompt)
  };
};
