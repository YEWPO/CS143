(*
 *  CS164 Fall 94
 *
 *  Programming Assignment 1
 *    Implementation of a simple stack machine.
 *
 *  Skeleton file
 *)

class Main inherits IO {

  machine : Machine <- (new Machine).init(">");

  main() : Object {
    machine.mainLoop()
  };

};
