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
    if stack.size() < 2 then
      1
    else
      let src1 : Int <- a2i(stack.top()) in {
        stack.pop();
        let src2 : Int <- a2i(stack.top()) in {
          stack.pop();
          let sum : Int <- src1 + src2 in {
            stack.push(i2a(sum));
          };
        };
      }
    fi
  };

  swap() : Object {
    if stack.size() < 2 then
      1
    else
      let src1 : String <- stack.top() in {
        stack.pop();
        let src2 : String <- stack.top() in {
          stack.pop();
          stack.push(src1);
          stack.push(src2);
        };
      }
    fi
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
          if (stack.empty()) then
            1
          else
            execute()
          fi
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
