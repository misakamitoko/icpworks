import Array "mo:base/Array";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import Text "mo:base/Text";
actor {
  func quicksortHelper(n :[var Int], left: Nat, right: Nat){
    if(left >= right) return;
    var low = left;
    var high = right;
    var key = n[low];
    while(low < high){
      while(low < high and key <= n[high]) high := high - 1;
      n[low] := n[high];
      while(low < high and key >= n[low]) low := low + 1;
      n[high] := n[low];
    };
    n[low] := key;
    quicksortHelper(n, low + 1, right);
    quicksortHelper(n, left, low - 1);
  };
  func quciksort(n: [var Int]){
    var left: Nat= 0;
    var right: Nat = n.size();
    right := right - 1;
    quicksortHelper(n, 0, right);
  };

  public query func qsort(n: [Int]) : async [Int]{
    let mutableN = Array.thaw<Int>(n);
    quciksort(mutableN);
    let res = Array.freeze<Int>(mutableN);
    return res;

  };
  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
};
