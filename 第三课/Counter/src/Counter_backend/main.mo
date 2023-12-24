import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Blob "mo:base/Blob";
import Nat16 "mo:base/Nat16";
actor Counter{
  stable var counter = 0;

  // Get the value of the counter.
  public query func get() : async Nat {
    return counter;
  };

  // Set the value of the counter.
  public func set(n : Nat) : async () {
    counter := n;
  };

  // Increment the value of the counter.
  public func inc() : async () {
    counter += 1;
  };
  type HttpRequest = {
    body:Blob;
    headers:[HeaderField];
    method:Text;
    url:Text
  };
  type HttpResponse = {
    body: Blob;
    headers:[HeaderField];
    status_code:Nat16
  };
  type HeaderField = (Text, Text);
  public query func http_request(arg: HttpRequest) : async HttpResponse{
    {
      body = Text.encodeUtf8(Nat.toText(counter));
      headers = [];
      status_code = 200;
    }
  }
};